class PurchaseMailer < ActionMailer::Base
    layout 'purchase_mailer'
    default from: 'Rails Payments <b.xavi@hotmail.es>'

    def purchase_receipt purchase
        @purchase = purchase
        mail to: purchase.email, subject: 'Thanks for your bussiness!'
    end
end