import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/helper/show_snack_bar.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotesView(
                note: note,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  showSnackBar(context, 'Success Deleted');
                },
                icon: const Icon(
                  size: 30,
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:notes_app/cubits/cubit/notes_cubit.dart';
// import 'package:notes_app/models/note_model.dart';
// import 'package:notes_app/views/edit_notes_view.dart';

// class NotesItem extends StatefulWidget {
//   const NotesItem({super.key, required this.note});
//   final NoteModel note;

//   @override
//   _NotesItemState createState() => _NotesItemState();
// }

// class _NotesItemState extends State<NotesItem>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: Offset.zero,
//       end: const Offset(1.5, 0),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _deleteNote() async {
//     await _controller.forward(); // Start animation
//     widget.note.delete();
//     BlocProvider.of<NotesCubit>(context)
//         .fetchAllNotes(); // Fetch notes after deletion
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return const EditNotesView();
//             },
//           ),
//         );
//       },
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Container(
//           padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
//           decoration: BoxDecoration(
//             color: Color(widget.note.color),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               ListTile(
//                 title: Text(
//                   widget.note.title,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 26,
//                   ),
//                 ),
//                 subtitle: Padding(
//                   padding: const EdgeInsets.only(top: 15, bottom: 15),
//                   child: Text(
//                     widget.note.subtitle,
//                     style: TextStyle(
//                       color: Colors.black.withOpacity(0.5),
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 trailing: IconButton(
//                   onPressed: _deleteNote,
//                   icon: const Icon(
//                     FontAwesomeIcons.trash,
//                     color: Colors.black,
//                     size: 30,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 24),
//                 child: Text(
//                   widget.note.date,
//                   style: TextStyle(
//                     color: Colors.black.withOpacity(0.5),
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
