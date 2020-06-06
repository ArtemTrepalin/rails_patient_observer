class PatientObserver < ActiveRecord::Observer
  observe :patient

  def after_update(record)
    history = History.new({watcher_id: record.watcher_id, status_id: record.status_id, patient_id: record.id})
    history.save
  end
end
