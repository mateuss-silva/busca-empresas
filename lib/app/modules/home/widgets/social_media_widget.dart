import 'package:empresas_flutter/app/modules/home/widgets/icon_button_widget.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatelessWidget {
  final EnterpriseModel enterprise;

  const SocialMediaWidget({Key? key, required this.enterprise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _iconButtonWidget(
                icon: FontAwesomeIcons.twitter,
                color: Colors.blue,
                link: enterprise.twitter,
                context: context),
            const SizedBox(height: 16),
            _iconButtonWidget(
                icon: FontAwesomeIcons.linkedin,
                color: Colors.blue.shade700,
                link: enterprise.linkedin,
                context: context),
            const SizedBox(height: 16),
            _iconButtonWidget(
                icon: FontAwesomeIcons.facebook,
                color: Colors.blue.shade700,
                link: enterprise.facebook,
                context: context),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _iconButtonWidget(
      {required IconData icon,
      required Color color,
      required String? link,
      required context}) {
    return IconButtonWidget(
      icon: icon,
      color: _isNullOrEmpty(link) ? Colors.grey : color,
      onPressed: _isNullOrEmpty(link)
          ? null
          : () {
              _launchURL(link!, context);
            },
    );
  }

  void _launchURL(String url, context) async {
    if (!await launch(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Não foi possível abrir o link')));
    }
  }

  bool _isNullOrEmpty(String? value) => value == null || value.isEmpty;
}
