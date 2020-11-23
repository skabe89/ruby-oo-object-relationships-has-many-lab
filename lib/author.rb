class Author

    attr_accessor :name
    @@all_posts = []

    def initialize(name)
        @name = name
    end

    def posts
        Post.all.select{|i| i.author == self}
        Post.all.each{|i| @@all_posts << i}
    end

    def add_post(post)
        post.author = self
        @@all_posts << post
    end

    def add_post_by_title(title)
        post = Post.new(title)
        post.author = self
        @@all_posts << post
    end

    def self.post_count
        @@all_posts.uniq.length
    end

end