﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////


// контекст фреймворка Vanessa-ADD
Перем Ванесса;


// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;


// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-ADD.
Перем КонтекстСохраняемый Экспорт;


// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;

	ВсеТесты = Новый Массив;

	//описание параметров
	// пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты, Снипет, ИмяПроцедуры, ПредставлениеТеста, ОписаниеШага, ТипШагаДляОписания, ТипШагаВДереве);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВСтруктуреСценарияЕстьШагСПараметромИЗначениемИПростымПараметром(Параметр,Значение,Парам03)","ВСтруктуреСценарияЕстьШагСПараметромИЗначениемИПростымПараметром","И в структуре сценария есть шаг с параметром <Параметр> и значением <Значение> и простым ""ПростойПараметр"" параметром","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВСтруктуреСценарияЕстьШагПростоПринимающийТаблицу(ТабПарам)","ВСтруктуреСценарияЕстьШагПростоПринимающийТаблицу","И в структуре сценария есть шаг просто принимающий таблицу","","");

	Возврат ВсеТесты;
КонецФункции

// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	Возврат ПолучитьМакет(ИмяМакета);
КонецФункции


// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////


// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт

КонецПроцедуры


// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт

КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////


//И в структуре сценария есть шаг просто принимающий таблицу
//@ВСтруктуреСценарияЕстьШагПростоПринимающийТаблицу(ТабПарам)
Процедура ВСтруктуреСценарияЕстьШагПростоПринимающийТаблицу(ТабПарам) Экспорт
	Для Каждого СтрокаТабПарам Из ТабПарам Цикл
		КонтекстСохраняемый.Вставить(СтрокаТабПарам.Кол1,СтрокаТабПарам.Кол2);
	КонецЦикла;
КонецПроцедуры


//И в структуре сценария есть шаг с параметром <Параметр> и значением <Значение> и простым "ПростойПараметр" параметром
//@ВСтруктуреСценарияЕстьШагСПараметромИЗначениемИПростымПараметром(Параметр,Значение,Парам03)
Процедура ВСтруктуреСценарияЕстьШагСПараметромИЗначениемИПростымПараметром(Параметр,Значение,ТретийПараметр) Экспорт
	КонтекстСохраняемый.Вставить(Параметр,Значение);
	КонтекстСохраняемый.Вставить(ТретийПараметр,Значение);
КонецПроцедуры
