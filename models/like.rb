class Like < CouchRest::Model::Base
  unique_id :id
  # property <name>
  property :referrer, String
  property :action, String
  property :api_key, String
  property :channel_url, String
  property :colorscheme, String
  property :extended_social_context, String
  property :href, String
  property :layout, String
  property :locale, String
  property :node_type, String
  property :sdk, String
  property :show_faces, String
  property :site, String
  
  timestamps!

  def initialize(attributes = {}, options = {})
    if defined? attributes["id"]
      attributes["fb_id"] = attributes["id"] 
      attributes["id"] = nil
    end
    super attributes, options
  end

  design do
    view :by_action
    view :by_created_at
    view :by_type
    view :by_referrer
    view :by_href
  end

  view_by :refs,                                                
    :map =>                                                     
      "function(doc) {                                          
        if (doc['type'] == 'Like' && doc.href && doc.referrer) {                   
          emit(doc.href, doc.referrer);                                   
        }                                                       
      }"

  view_by :api_key,                                                
    :map =>                                                     
      "function(doc) {                                          
        if (doc['type'] == 'Like' && doc.api_key && doc.referrer) {                   
          emit(doc.api_key, doc.referrer);                                   
        }                                                       
      }",
     :reduce =>                                                  
       "function(keys, values, rereduce) {                       
          if (rereduce) {
            return sum(values);
          } else {
            return values.length;
          }
       }"  

end
