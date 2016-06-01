﻿////////////////////////////////////////////////////////////////////
//
// Скрипт используется для корректного, платформонезависимого 
// создания дистрибутива ZIP при сборке на Linux
//
// (с) EvilBeaver, 2016
//
////////////////////////////////////////////////////////////////////

Процедура Упаковать(Знач Каталог, Знач ЦелевойАрхив)

	ЗаписьАрхива = Новый ЗаписьZipФайла(ЦелевойАрхив);
	ЗаписьАрхива.Добавить(Каталог + "/*", РежимСохраненияПутейZIP.СохранятьОтносительныеПути, РежимОбработкиПодкаталоговZIP.ОбрабатыватьРекурсивно);
	ЗаписьАрхива.Записать();

КонецПроцедуры

Процедура Распаковать(Знач ЦелевойАрхив, Знач Каталог)
	
	ЧтениеАрхива = Новый ЧтениеZipФайла(ЦелевойАрхив);
	ЧтениеАрхива.ИзвлечьВсе(Каталог);
	ЧтениеАрхива.Закрыть();
	
КонецПроцедуры

Процедура Выполнить()

	Команда = АргументыКоманднойСтроки[0];
	Если Команда = "pack" Тогда
		Упаковать(АргументыКоманднойСтроки[1], АргументыКоманднойСтроки[2]);
	ИначеЕсли Команда = "unpack" Тогда
		Распаковать(АргументыКоманднойСтроки[1], АргументыКоманднойСтроки[2]);
	Иначе
		ВызватьИсключение "Неизвестная команда";
	КонецЕсли;

КонецПроцедуры

////////////////////////////////////////////////////////////////////

Попытка
	Выполнить();
Исключение
	Сообщить(ОписаниеОшибки());
	ЗавершитьРаботу(1);
КонецПопытки;
