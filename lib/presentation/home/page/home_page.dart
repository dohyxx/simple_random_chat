import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_random_chat/presentation/common/app_router/provider/go_router_provider.dart';
import 'package:simple_random_chat/presentation/common/app_router/route_name.dart';
import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_app_bar.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_layout.dart';
import 'package:simple_random_chat/presentation/home/widget/feature_button_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
        edgeInsets: EdgeInsets.all(20),
        appBar: DefaultAppBar(
          leading: SizedBox(),
          title: "Home",
        ),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FeatureButtonWidget(
                      title: 'ChatRoom',
                      icon: AppIcon.menu,
                      onTap: () {
                        NavigationHelper.push(RouteName.chatList);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
