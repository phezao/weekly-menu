module ApplicationHelper

    def to_day(number)
       day_string =  {
            "1": "Domingo",
            "2": "Segunda",
            "3": "Terça",
            "4": "Quarta",
            "5": "Quinta",
            "6": "Sexta",
            "7": "Sábado"
        }
        return day_string[:"#{number}"]
    end
end
