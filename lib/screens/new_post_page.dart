import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// A screen that lets the user compose and submit a new post.  The post is
/// written to Firestore with the current user’s ID and a server timestamp【763019382370886†L228-L244】.
class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isSubmitting = false;

  /// Writes the post document to Firestore.  Shows an error if the user is
  /// unauthenticated or the content is empty.
  Future<void> _submit() async {
    final user = FirebaseAuth.instance.currentUser;
    final content = _controller.text.trim();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must be logged in to post.')),
      );
      return;
    }
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post cannot be empty.')),
      );
      return;
    }
    setState(() => _isSubmitting = true);
    try {
      await FirebaseFirestore.instance.collection('posts').add({
        'content': content,
        'authorId': user.uid,
        'authorName': user.email ?? 'Unknown',
        'timestamp': FieldValue.serverTimestamp(),
      });
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to post: $e')),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'What’s on your mind?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            _isSubmitting
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Post'),
                  ),
          ],
        ),
      ),
    );
  }
}