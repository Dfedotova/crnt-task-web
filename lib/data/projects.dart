import 'package:crnt_task/data/tasks.dart';
import 'package:crnt_task/models/project.dart';

final allProjects = <Project>[
  Project(
    name: 'Sowin',
    id: 'SWN',
    direction: 'верстка сайта',
    description: 'Корпоративный сайт для компании Sowin',
    responsible: 'Федотова Дарья',
    tasks: sowinTasks,
  ),
  Project(
    name: 'ТопСтанок',
    id: 'TOP',
    direction: 'верстка сайта',
    description: 'Корпоративный сайт для компании Sowin',
    responsible: 'Федотова Дарья',
  ),
  Project(
    name: 'Skillbox',
    id: 'SKB',
    direction: 'дизайн',
    description: 'Создание иллюстраций в корпоративном стиле',
    responsible: 'Иванов Олег',
    tasks: skillboxTasksIllustrations,
  ),
  Project(
    name: 'lit.agency',
    id: 'LIT',
    direction: 'дизайн',
    description: 'Создание рекламных креативов для издательства',
    responsible: 'Иванов Олег',
  ),
  Project(
    name: 'American Dream',
    id: 'AMD',
    direction: 'моушн-дизайн',
    description: 'Моушн-дизайн',
    responsible: 'Иванов Олег',
  ),
  Project(
    name: 'Нарраторика',
    id: 'NAR',
    direction: 'верстка сайта',
    description: 'Лендинг для курса Никиты Веселко по UE5',
    responsible: 'Федотова Дарья',
  ),
  Project(
    name: 'ERIDAN',
    id: 'ERD',
    direction: 'дизайн',
    description: 'Создание бренд-бука',
    responsible: 'Иванов Олег',
  ),
  Project(
    name: 'Learnity',
    id: 'LRN',
    direction: 'дизайн',
    description: 'Разработка фирменного стиля',
    responsible: 'Иванов Олег',
  ),
  Project(
    name: 'Skillbox',
    id: 'SKB',
    direction: 'презентации',
    description: 'Верстка презентаций к онлайн-курсам',
    responsible: 'Федотова Дарья',
    tasks: skillboxTasksPresentations,
  ),
];
