//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CAFE_Song_Lo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class food
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public food()
        {
            this.billinfoes = new HashSet<billinfo>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public double price { get; set; }
        public int idcategory { get; set; }
        public string image { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<billinfo> billinfoes { get; set; }
        public virtual category category { get; set; }
    }
}
