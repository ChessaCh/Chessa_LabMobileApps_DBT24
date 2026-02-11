import '../models/contact.dart';
import '../models/message.dart';

final List<Contact> contacts = [
  Contact(
    name: 'Oliv',
    lastMessage: 'baiklah',
    time: '9:45am',
    avatarUrl: 'https://i.pinimg.com/736x/2b/fe/e0/2bfee07c47bbe789f28ed2496c5767f6.jpg',
    isOnline: true,
  ),
  Contact(
    name: 'Grace',
    lastMessage: 'IYAWOI ADUH DIMANA YA',
    time: '3:50pm',
    avatarUrl: 'https://i.pinimg.com/1200x/72/9f/43/729f432176f0a3824092d7b5dd40a3ae.jpg',
    isOnline: false,
  ),
  Contact(
    name: 'Monik',
    lastMessage: 'WKWKK',
    time: '1:05pm',
    avatarUrl: 'https://i.pinimg.com/736x/b5/18/41/b5184171fd55fc19e78ef17459bdd908.jpg',
    isOnline: true,
  ),
  Contact(
    name: 'Eryn',
    lastMessage: 'okeeii tenkss',
    time: '11:08am',
    avatarUrl: 'https://i.pinimg.com/736x/52/d8/c3/52d8c355d1e3820f3f880fa0cdfa8307.jpg',
    isOnline: false,
  ),
];

Map<String, List<Message>> contactMessages = {
  'Oliv': [
    Message(text: 'liv', isSentByMe: true, time: '9:40am'),
    Message(text: 'dh makan ga', isSentByMe: true, time: '9:41am'),
    Message(text: 'bahari yok', isSentByMe: true, time: '9:42am'),
    Message(text: 'blh gas', isSentByMe: false, time: '9:43am'),
    Message(text: 'jamber', isSentByMe: true, time: '9:44am'),
    Message(text: 'skrng aja?', isSentByMe: true, time: '9:44am'),
    Message(text: '10 mnt', isSentByMe: false, time: '9:45am'),
    Message(text: 'baiklah', isSentByMe: true, time: '9:45am'),
  ],
  'Grace': [
    Message(text: 'chessaaaa', isSentByMe: false, time: '3:46pm'),
    Message(text: 'masi dikelas gaaa huhu', isSentByMe: false, time: '3:46pm'),
    Message(text: 'ada botolkuu ga disanaa?', isSentByMe: false, time: '3:47pm'),
    Message(text: 'masiii gracee', isSentByMe: true, time: '3:48pm'),
    Message(text: 'ga adaa sii kenapa weh ilang lagi?', isSentByMe: true, time: '3:49pm'),
    Message(text: 'IYAWOI ADUH DIMANA YA', isSentByMe: false, time: '3:50pm'),
  ],
  'Monik': [
    Message(text: 'dh nyampe mon?', isSentByMe: true, time: '1:00pm'),
    Message(text: 'di eka', isSentByMe: false, time: '1:01pm'),
    Message(text: 'kau dmn', isSentByMe: false, time: '1:01pm'),
    Message(text: 'HAH BUKANNYA DI 3021?', isSentByMe: true, time: '1:02pm'),
    Message(text: 'eh... iya maksudnya ku tdi di kantin eka', isSentByMe: false, time: '1:04pm'),
    Message(text: 'ni dah csl', isSentByMe: false, time: '1:04pm'),
    Message(text: 'MON? AKU UD PANIK', isSentByMe: true, time: '1:04pm'),
    Message(text: 'WKWKK', isSentByMe: false, time: '1:05pm'),
  ],
  'Eryn': [
    Message(text: 'rynn', isSentByMe: true, time: '11:00am'),
    Message(text: 'kau uda dikelas?', isSentByMe: true, time: '11:00am'),
    Message(text: 'Iyaa udh', isSentByMe: false, time: '11:02am'),
    Message(text: 'bapaknya uda dtg blmmm?', isSentByMe: true, time: '11:05am'),
    Message(text: 'Blm', isSentByMe: false, time: '11:06am'),
    Message(text: 'okeeii tenkss', isSentByMe: true, time: '11:08am'),
  ],
};
