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
    ::PageFile.create(id: 'page-1').tap do |p|
      p.page_number = 1
      p.text = "Once upon a midnight dreary..."
      p.save
    end
    ::PageFile.create(id: 'page-2').tap do |p|
      p.page_number = 2
      p.text = "The End"
      p.save
    end
    collection.generic_works << work
    work.generic_files << file
    work.generic_files << page1
    work.generic_files << page2

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

  def page1
    ::PageFile.find('page-1')
  end

  def page2
    ::PageFile.find('page-2')
  end

end
