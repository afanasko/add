﻿# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOn837
@IgnoreOn839

#из-за ошибки web клиента в 8.3.10
@IgnoreOnWeb8310

@tree


Функционал: Автоматизированное получение изменения состояния таблицы формы

Как Разработчик я хочу
Чтобы у меня был функционал для получения шагов Gherkin при изменении таблицы формы
Для того чтобы я мог использовать их в своих сценариях без программирования

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда я удаляю все элементы Справочника "Справочник1"
	# Когда я создаю fixtures по макету "Макет"

Сценарий: Проверка получения состояния дробных чисел

	Когда я нажмаю на кнопку Vanessa-ADD "Начать запись поведения"
	Когда я открываю форму для ввода табличных данных
		Когда Я нажимаю кнопку командного интерфейса "Основная"
		И В панели функций я выбираю 'Справочник1'
		Тогда открылось окно 'Справочник1'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Справочник1 (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Тест генерации таблицы'
		И я перехожу к следующему реквизиту
		Тогда открылось окно 'Справочник1 (создание) *'
	И     я нажмаю на кнопку Vanessa-ADD "Запомнить состояние формы TestClient"
	И добавляю дробное число в таблицу
		И в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
		И в таблице "ТабличнаяЧасть1" в поле 'Реквизит число' я ввожу текст '12,34'
		И я перехожу к следующему реквизиту
		# И в таблице "ТабличнаяЧасть1" в поле 'Реквизит строка' я ввожу текст 'ыфва'
		# И я перехожу к следующему реквизиту
		# И в таблице "ТабличнаяЧасть1" в поле 'Реквизит дата' я ввожу текст '01.01.1991'
		# И я перехожу к следующему реквизиту
		# И я перехожу к следующему реквизиту
		И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки

	Тогда таблица "ТабличнаяЧасть1" содержит строки:
# 	Тогда таблица "ТабличнаяЧасть1" стала равной:
		| Реквизит число |
		| '12,34'          |
	Тогда таблица "ТабличнаяЧасть1" содержит строки:
# 	Тогда таблица "ТабличнаяЧасть1" стала равной:
		| N | Реквизит булево | Реквизит число | Реквизит справочник выбор из формы списка | Реквизит строка | Реквизит дата | Реквизит справочник | Реквизит быстрый выбор ТЧ | Многострочная строка |
		| 1 | Нет             | '12,34'        | ''                                        | ''              | ''            | ''                  | ''                        | ''                   |

	И я фиксирую изменения в форме Vanessa-ADD
		И     я нажмаю на кнопку Vanessa-ADD "Закончить запись поведения"
		# И     я нажмаю на кнопку Vanessa-ADD "Получить состояние текущего элемента формы"
		И     я нажмаю на кнопку Vanessa-ADD "ПолучитьИзмененияФормыGherkin"
		И     я нажмаю на кнопку Vanessa-ADD "Забыть состояние формы TestClient"

	И я проверяю правильность формирования дробного числа
		Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка "\'12,34\'"
