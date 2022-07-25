Перем ПарсерСоединений;
Перем Маршрутизатор;

&Желудь
Процедура ПриСозданииОбъекта(
							&Пластилин("ПарсерСоединений") _ПарсерСоединений,
							&Пластилин("Маршрутизатор") _Маршрутизатор
							)
	ПарсерСоединений = _ПарсерСоединений;
	Маршрутизатор = _Маршрутизатор;
КонецПроцедуры

Процедура Обработать(Соединение) Экспорт

	Запрос = ПарсерСоединений.ПолучитьЗапрос(Соединение);	

	ОбработчикИПараметры = Маршрутизатор.НайтиОбработчикИПараметрыПоПолномуПути(Запрос.Путь);

	Запрос.ПараметрыПорядковые = ОбработчикИПараметры.Параметры;

	Если ЗначениеЗаполнено(ОбработчикИПараметры.Действие) Тогда

		Ответ = ОбработчикИПараметры.Действие.Выполнить(Запрос);

		Соединение.ОтправитьСтроку(Ответ);

	Иначе

		Соединение.ОтправитьСтроку("404", "utf-8");

	КонецЕсли;

	Соединение.Закрыть();

КонецПроцедуры