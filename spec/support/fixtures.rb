module Fixtures

  def load_examples
    ::Collection.create(id: 'col-1').tap do |c|
      c.title = "Works by Edgar Allan Poe"
      c.save
    end
    ::BibliographicWork.create(id: 'work-1').tap do |w|
      w.title    = "The Raven"
      w.author   = "Poe, Edgar Allan"
      w.abstract = "A lonely man tries to ease his 'sorrow for the lost Lenore', by distracting his mind with old books of 'forgotten lore'."
      w.save
    end
    ::BibliographicFile.create(id: 'gfile-1').tap do |f|
      f.title = "The Raven pdf"
      f.save
    end
  end

  def collection
    ::Collection.find("col-1")
  end

  def work
    ::BibliographicWork.find("work-1")
  end

  def file
    ::BibliographicFile.find("gfile-1")
  end

end
