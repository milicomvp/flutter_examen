import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/screen.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Objetos'),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon((Icons.home_outlined)),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon((Icons.category_outlined)),
          title: const Text('Categorías'),
          onTap: () {
            //close navigation drawer before
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListCategScreen()));
          },
        ),
        ListTile(
          leading: const Icon((Icons.checkroom_outlined)),
          title: const Text('Productos'),
          onTap: () {
            //close navigation drawer before
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListProductScreen()));
          },
        ),
        ListTile(
          leading: const Icon((Icons.contact_mail_outlined)),
          title: const Text('Proveedores'),
          onTap: () {
            //close navigation drawer before
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListProvScreen()));
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon((Icons.exit_to_app_outlined)),
          title: const Text('Salir'),
          onTap: () {
            //close navigation drawer before
            Navigator.pop(context);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),
      ],
    );
  }
}
