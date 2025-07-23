import 'package:estado/domain/entities/user.dart';

final fakeUser = [
  User(
    id: "1",
    name: '',
    age: 0,
    email: '',
    description: '',
    professionsId: ['p1', 'p2', 'p3'], 
    profileImageUrl: '',
  ),
  User(
    id: "2",
    name: 'Noe',
    age: 28,
    email: 'lucia@example.com',
    description: 'Frontend developer',
    professionsId: ['p4', 'p5', 'p6'], 
    profileImageUrl: '',
  ),
  User(
    id: "3",
    name: 'Cristi',
    age: 28,
    email: 'lucia@example.com',
    description: 'Frontend developer',
    professionsId: ['p7', 'p8', 'p1'], 
    profileImageUrl: '',
  ),
];
