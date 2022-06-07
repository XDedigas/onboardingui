import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboardingui/components/pageOnboarding.dart';
import 'package:onboardingui/utilities/styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _pagAtual = 0;

  List<Widget> _criaIndicadorPage() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _pagAtual ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isAtivo) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isAtivo ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isAtivo ? Colors.white : Colors.blue,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.indigo,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    // ignore: avoid_print
                    onPressed: () => print('Pular'),
                    child: const Text(
                      'Pular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _pagAtual = page;
                      });
                    },
                    children: [
                      PageOnboarding(
                        infoPrincipal:
                            'Primeira tela de apresentação Onboarding',
                        infoDetalhes:
                            'Aqui está as informações principais da primeira tela de onboarding. Serão apresentadas um total de 3 telas.',
                        image:
                            const AssetImage('assets/images/onboarding0.png'),
                      ),
                      PageOnboarding(
                        infoPrincipal:
                            'Segunda tela de apresentação Onboarding',
                        infoDetalhes:
                            'Aqui está as informações secundárias da tela de onboarding. Serão apresentadas um total de 3 telas.',
                        image:
                            const AssetImage('assets/images/onboarding1.png'),
                      ),
                      PageOnboarding(
                        infoPrincipal: 'Última tela de apresentação Onboarding',
                        infoDetalhes:
                            'Aqui está as informações finais da tela de onboarding. Essa é a última tela que será apresentada.',
                        image:
                            const AssetImage('assets/images/onboarding2.png'),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _criaIndicadorPage(),
                ),
                _pagAtual != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Próximo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _pagAtual == _numPages - 1
          ? Container(
              height: 80.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                // ignore: avoid_print
                onTap: () => print('Iniciar'),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Começar',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
