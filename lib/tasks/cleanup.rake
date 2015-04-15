task cleanup: :environment do

  task from_deleted_user: :environment do
    Membership.all.each do |membership|
      if membership.user == nil
        membership.destroy
      end
    end
  end

  task from_deleted_projects: :environment do
    Membership.all.each do |membership|
      if membership.projects == nil
        membership.destroy
      end
    end
  end

  task remove_task_from_deleted_projects: :environment do
    Task.all.each do |task|
      if task.projects == nil
        task.destroy
      end
    end
  end

  task remove_comments_from_deleted_tasks: :environment do
    Comment.all.each do |comment|
      if comment.tasks == nil
        comment.destroy
      end
    end
  end

  task set_user_id_of_comments_to_nil_if_users_are_deleted: :environment do
    Comment.all.each do |comment|
      if comment.users == nil
        comment.user_id == nil
      end
    end
  end

  task remove_tasks_w_null_proj_id: :environment do
    Task.all.each do |task|
      if task.project_id == nil
        task.destroy
      end
    end
  end

  task remove_comments_w_null_task_id: :environment do
    Comment.all.each do |comment|
      if comment.task_id == nil
        comment.destroy
      end
    end
  end

  task any_membership_w_null_project_or_user_id: :environment do
    Membership.all.each do |membership|
      if membership.project_id == nil || membership.user_id == nil
        membership.destroy
      end
    end
  end

end
