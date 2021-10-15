import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  final Function saveFilters;
  final Map <String, bool> currentFilters;

  const SettingsScreen({this.currentFilters , this.saveFilters});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map <String, bool> _filters = {
      'gluten': _glutenFree,
      'vegetarian': _vegetarian,
      'vegan': _vegan,
      'lactose': _lactoseFree,
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(onPressed: (){
            widget.saveFilters(_filters);
            Navigator.of(context).pushReplacementNamed('/');
          }, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              CustomSwitchListTile(
                  title: 'Gluten Free',
                  subtitle: 'Only include Gluten Free meals',
                  isTrue: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              CustomSwitchListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  isTrue: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              CustomSwitchListTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals',
                  isTrue: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
              CustomSwitchListTile(
                  title: 'lactose Free',
                  isTrue: _lactoseFree,
                  subtitle: 'Only include lactose free meals',
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}

class CustomSwitchListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isTrue;
  final Function onChanged;

  const CustomSwitchListTile(
      {@required this.title,
      this.subtitle = '',
      @required this.isTrue,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: isTrue,
        onChanged: onChanged);
  }
}
