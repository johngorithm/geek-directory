import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/user.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/ui/widgets/geek_card_widget.dart';
import 'package:geekdirectory/view_models/profile_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileScreenModel model;

  ProfileScreen({this.model});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenModel profileModel;

  @override
  void initState() {
    profileModel = widget.model ?? ProfileScreenModel();
    profileModel.navigator = Navigator.of(context);
    profileModel.getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<ProfileScreenModel>(
      create: (_) => profileModel,
      child: Scaffold(
        body: Consumer<ProfileScreenModel>(
          builder: (context, model, child) {
            if (model.busy) {
              return BusyIndicator();
            }

            if (model.screenMessage != null) {
              return Text(model.screenMessage);
            }

            return ProfileLayout(model.user);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    profileModel.dispose();
    super.dispose();
  }
}

class ProfileLayout extends StatefulWidget {
  final User user;

  ProfileLayout(this.user);

  @override
  _ProfileLayoutState createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  ProfileScreenModel _profileModel;

  @override
  void didChangeDependencies() {
    _profileModel = Provider.of<ProfileScreenModel>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Stack(
        children: <Widget>[
          contentLayout,
        ],
      )
    );
  }

  Widget get contentLayout => Column(
    children: <Widget>[
      headerLayout,
      themeLayout,
      viewedLayout,
      favCountLayout
    ],
  );

  Widget get headerLayout {
    String tempImage = 'https://movies-b26f.kxcdn.com/wp-content/uploads/2017/03/bossbaby_4-1024x1024.jpg';
    return Container(
      height: 150,
      color: Palette.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Palette.primary, width: 3),
              shape: BoxShape.circle
            ),
            child: CircleAvatar(
              backgroundColor: Palette.white,
              backgroundImage: CachedNetworkImageProvider(widget.user.profileImage ?? tempImage),
              onBackgroundImageError: (_, __) {},
              radius: 45,
            ),
          ),

          SizedBox(width: 20.0,),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ACCOUNT'),
                SizedBox(height: 5.0,),
                Text(widget.user.email, style: TextStyle(
                  color: Palette.largeTextDarkGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get themeLayout {
    return Container(
      color: Palette.white,
      margin: EdgeInsets.only(top: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('COLOR MODE'),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Dark'),
              Selector<ProfileScreenModel, bool>(
                selector: (context, model) => model.isDarkModeSelected,
                builder: (context, isDarkModeSelected, child) => Switch(
                  value: isDarkModeSelected,
                  onChanged: (isOn) {
                    _profileModel.toggleDarkMode(isOn);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget get viewedLayout {
    return Container(
      color: Palette.white,
      margin: EdgeInsets.only(top: 5.0),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('VIEWED GEEKS'),
          SizedBox(height: 20.0,),

          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _profileModel.viewedGeeks.length,
              itemBuilder: (context, index) {
                var geekDetail = _profileModel.viewedGeeks.elementAt(index);

                return GeekDetailCard(geekDetail, () {
                  _profileModel.actionSelectGeek(geekDetail);
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget get favCountLayout => Container(
    color: Palette.white,
    margin: EdgeInsets.only(top: 5.0),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('FAVORITES'),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Count'),
            Row(
              children: <Widget>[
                Icon(Icons.favorite,
                  color: Palette.accentColor,
                ),
                SizedBox(width: 5,),
                Text('${_profileModel.favCount}')
              ],
            )
          ],
        )
      ],
    ),
  );

}
