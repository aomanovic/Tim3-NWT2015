class Activity < ActiveRecord::Base
  def get_message
    if self.key == 'symptom.is_created'
      content = Symptom.find(self.trackable_id).name + ' symptom is created.'
      url = '/symptoms/' + self.trackable_id.to_s
      icon = 'glyphicon glyphicon-plus'
      { content: content, url: url, icon: icon }
    end
  end

  def serializable_hash options={}
    {
      msg:              self.get_message,
      key:              key,
      timestamp:        created_at.strftime('%d.%m.%Y %H:%M:%S')
    }
  end
end