import 'package:flutter/material.dart';

class DetallesAlbum extends StatelessWidget {
  const DetallesAlbum({super.key});
  @override
  Widget build(BuildContext context) {
    final String movie= 
    ModalRoute.of(context)?.settings.arguments.toString() ?? 
    'Sin nombre';
    return const Scaffold(
      body: CustomScrollView(
        //widget con comportamiento definido alm scroll
        slivers: [_CustomAppBar(),
        SliverList(delegate: SliverChildListDelegate.fixed([
          _PosterAndTitle(),
          _Overview(),
        ])
        )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 0, 255, 221),
      expandedHeight: 100,
      floating: false,
      pinned: true,
      //widget para que se ajuste al tamaño
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //eliminar pading
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text('movie.title',
          style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/loading.gif'),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              height: 200,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title',
              style: TextStyle(fontSize: 30),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
              Text(
                'movie.titleOriginal',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.start_outlined,
                    size: 20,
                    color: const Color.fromARGB(255, 0, 255, 8),
                  ),
                  SizedBox(width: 5),
                  Text(
                'movie.voteAverage',
                   style: TextStyle(fontSize: 18),
                   textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                   maxLines: 2,
              ),
                ],
              )
            ],
          )
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20, 
        vertical: 10,
      ),
      child: Text('Deserunt ut ut cupidatat tempor aute quis pariatur qui veniam ea excepteur duis do. Qui deserunt dolore in consequat tempor cillum sint sunt esse nostrud culpa. Cupidatat mollit amet consequat cillum ea cupidatat. Lorem adipisicing culpa est mollit occaecat mollit. Culpa elit est ullamco reprehenderit elit culpa dolore ut occaecat laboris dolore dolore.',
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 15),
      ),
    );
  }
}