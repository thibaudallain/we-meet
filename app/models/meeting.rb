class Meeting < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  # validates :event_id, presence: true
  # validates :user_id, presence: true

  validates_inclusion_of :organizer, in: [true, false]
  validates_inclusion_of :attending, in: [true, false]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_update :broadcast_message

  private

  def broadcast_message
    ActionCable.server.broadcast("event_#{event.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "meetings/participant_attending",
        locals: { meeting: self }
      ),
      btn_partial: ApplicationController.renderer.render(
        partial: "meetings/btn",
        locals: { event: self.event }
      ),
      btn_recap_partial: ApplicationController.renderer.render(
        partial: "meetings/recap",
        locals: { event: self.event }
      ),
      dispos_partial: ApplicationController.renderer.render(
        partial: "meetings/dispos",
        locals: { event: self.event }
      ),
      votants_partial: ApplicationController.renderer.render(
        partial: "meetings/votants",
        locals: { event: self.event }
      ),
      attending: attending,
      voted: voted
    })
  end


end
