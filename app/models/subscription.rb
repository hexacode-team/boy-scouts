class Subscription < ActiveRecord::Base
    belongs_to :route
    belongs_to :group
    has_many :payments

    def name
      return last_name + ', ' + first_name 
    end

    def street_address
      if address_line_2 != nil
        return address_line_1 + ' ' + address_line_2
      else
        return address_line_1
      end
    end

    def status
      today = Date.today()
      payments.each do |payment|
        if payment.end_date > today
          return "Good"
        end
      end

      return "Expired"
    end

    def self.get_require_invoices(group_id)

      routes = Group.find(group_id).routes
      subscriptions = []

      routes.each do |route|
        subscriptions += route.subscriptions
      end

      today = Date.today()
      subs_that_need_invoices = []
      subscriptions.each do |sub|
        needs_invoice = true
        payments = sub.payments

        #if we cannot find a payment for a subscription, we obviously need an invoice
        if payments.blank?
          subs_that_need_invoices.append(sub)
          next
        end

        #if there are payments such good for at least the next 30 days....we need an invoice.

        payments.each do |payment|
          if (today < payment.end_date - 30)
            needs_invoice = false
            break
          end
        end

        if needs_invoice
          subs_that_need_invoices.append(sub)
        end

      end

      return subs_that_need_invoices.sort do |a, b|
        comp = (a.last_name <=> b.last_name)
        comp.zero? ? (a.first_name <=> b.first_name) : comp
      end
    end

end
