
Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьMD5");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьSHA1");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьSHA256");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьSHA384");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьSHA512");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьCRC32");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтоХешированиеНеЗанимаетФайл");
	
	Возврат ВсеТесты;
КонецФункции

Процедура ПослеЗапускаТеста() Экспорт
	юТест.УдалитьВременныеФайлы();
КонецПроцедуры

Процедура ТестДолжен_ПроверитьMD5() Экспорт
	Провайдер=Новый ХешированиеДанных(ХешФункция.MD5);
	Провайдер.Добавить("123");
	Провайдер.Добавить("456");
	Провайдер.Добавить("789");

	юТест.ПроверитьРавенство("25F9E794323B453885F5181F1B624D0B",Провайдер.ХешСуммаСтрокой);
	юТест.ПроверитьРавенство("25 F9 E7 94 32 3B 45 38 85 F5 18 1F 1B 62 4D 0B",Строка(Провайдер.ХешСумма));
КонецПроцедуры

Процедура ТестДолжен_ПроверитьSHA1() Экспорт
	Провайдер=Новый ХешированиеДанных(ХешФункция.SHA1);
	Провайдер.Добавить("123");
	Провайдер.Добавить("456");
	Провайдер.Добавить("789");

	юТест.ПроверитьРавенство("F7C3BC1D808E04732ADF679965CCC34CA7AE3441",Провайдер.ХешСуммаСтрокой);
	юТест.ПроверитьРавенство("F7 C3 BC 1D 80 8E 04 73 2A DF 67 99 65 CC C3 4C A7 AE 34 41",Строка(Провайдер.ХешСумма));
КонецПроцедуры

Процедура ТестДолжен_ПроверитьSHA256() Экспорт
	Провайдер=Новый ХешированиеДанных(ХешФункция.SHA256);
	Провайдер.Добавить("123");
	Провайдер.Добавить("456");
	Провайдер.Добавить("789");

	юТест.ПроверитьРавенство("15E2B0D3C33891EBB0F1EF609EC419420C20E320CE94C65FBC8C3312448EB225",Провайдер.ХешСуммаСтрокой);
	юТест.ПроверитьРавенство("15 E2 B0 D3 C3 38 91 EB B0 F1 EF 60 9E C4 19 42 0C 20 E3 20 CE 94 C6 5F BC 8C 33 12 44 8E B2 25",Строка(Провайдер.ХешСумма));
КонецПроцедуры

Процедура ТестДолжен_ПроверитьSHA384() Экспорт
	Провайдер=Новый ХешированиеДанных(ХешФункция.SHA384);
	Провайдер.Добавить("123");
	Провайдер.Добавить("456");
	Провайдер.Добавить("789");

	юТест.ПроверитьРавенство("EB455D56D2C1A69DE64E832011F3393D45F3FA31D6842F21AF92D2FE469C499DA5E3179847334A18479C8D1DEDEA1BE3",Провайдер.ХешСуммаСтрокой);
	юТест.ПроверитьРавенство("EB 45 5D 56 D2 C1 A6 9D E6 4E 83 20 11 F3 39 3D 45 F3 FA 31 D6 84 2F 21 AF 92 D2 FE 46 9C 49 9D A5 E3 17 98 47 33 4A 18 47 9C 8D 1D ED EA 1B E3",Строка(Провайдер.ХешСумма));
КонецПроцедуры

Процедура ТестДолжен_ПроверитьSHA512() Экспорт
	Провайдер=Новый ХешированиеДанных(ХешФункция.SHA512);
	Провайдер.Добавить("123");
	Провайдер.Добавить("456");
	Провайдер.Добавить("789");

	юТест.ПроверитьРавенство("D9E6762DD1C8EAF6D61B3C6192FC408D4D6D5F1176D0C29169BC24E71C3F274AD27FCD5811B313D681F7E55EC02D73D499C95455B6B5BB503ACF574FBA8FFE85",Провайдер.ХешСуммаСтрокой);
	юТест.ПроверитьРавенство("D9 E6 76 2D D1 C8 EA F6 D6 1B 3C 61 92 FC 40 8D 4D 6D 5F 11 76 D0 C2 91 69 BC 24 E7 1C 3F 27 4A D2 7F CD 58 11 B3 13 D6 81 F7 E5 5E C0 2D 73 D4 99 C9 54 55 B6 B5 BB 50 3A CF 57 4F BA 8F FE 85",Строка(Провайдер.ХешСумма));
КонецПроцедуры


Процедура ТестДолжен_ПроверитьCRC32() Экспорт
	Провайдер=Новый ХешированиеДанных(ХешФункция.CRC32);
	Провайдер.Добавить("123");
	Провайдер.Добавить("456");
	Провайдер.Добавить("789");

	юТест.ПроверитьРавенство("CBF43926",Провайдер.ХешСуммаСтрокой);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоХешированиеНеЗанимаетФайл() Экспорт

	Файл = юТест.ИмяВременногоФайла();

	Запись = Новый ЗаписьТекста(Файл);
	Запись.Записать("Привет");
	Запись.Закрыть();
	
	Провайдер = Новый ХешированиеДанных(ХешФункция.MD5);
	Провайдер.ДобавитьФайл(Файл);
	
	Провайдер2 = Новый ХешированиеДанных(ХешФункция.MD5);
	Провайдер2.ДобавитьФайл(Файл);

	Запись = Новый ЗаписьТекста(Файл);
	Запись.Записать("Привет");
	Запись.Закрыть();

КонецПроцедуры