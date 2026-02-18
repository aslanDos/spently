import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spently/core/constants/app_colors.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_state.dart';
import 'package:spently/features/home/presentation/widgets/account_capsule_widget.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  const HomeAppBar({super.key, required this.onTap});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      actionsPadding: EdgeInsets.symmetric(horizontal: 20),
      actions: [
        // AccountCapsule
        GestureDetector(
          onTap: widget.onTap,
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              if (state is AccountsLoaded) {
                return AccountCapsule(
                  selectedAccount: state.selectedAccount,
                  onAccountSelected: (_) {},
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),

        Spacer(),

        // Right Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAppBarActionButton(
              context,
              icon: CupertinoIcons.chart_bar,
              onTap: () {},
            ),
            SizedBox(width: 10),
            _buildAppBarActionButton(
              context,
              icon: CupertinoIcons.battery_charging,
              onTap: () {},
            ),
            SizedBox(width: 10),
            _buildAppBarActionButton(
              context,
              icon: CupertinoIcons.settings,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Container _buildAppBarActionButton(
    BuildContext context, {
    required IconData icon,
    required Function onTap,
  }) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.border),
      ),
      child: Icon(icon, size: 24, color: context.primary),
    );
  }
}
