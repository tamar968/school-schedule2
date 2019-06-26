public class XmlClasses
{
    // NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class root
    {

        public rootData[] dataField;

        public uint school_idField;

        public string data_typeField;

        public string eG_time2Field;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("data")]
        public rootData[] data
        {
            get
            {
                return this.dataField;
            }
            set
            {
                this.dataField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public uint school_id
        {
            get
            {
                return this.school_idField;
            }
            set
            {
                this.school_idField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string data_type
        {
            get
            {
                return this.data_typeField;
            }
            set
            {
                this.data_typeField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string EG_time2
        {
            get
            {
                return this.eG_time2Field;
            }
            set
            {
                this.eG_time2Field = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rootData
    {

        public string nameField;

        public byte numField;

        public byte mapField;

        public ushort idField;

        public byte class_numberField;

        public byte layerField;

        public byte reformaField;

        public byte schooltypeField;

        public ushort backColorField;

        public uint foreColorField;

        /// <remarks/>
        public string name
        {
            get
            {
                return this.nameField;
            }
            set
            {
                this.nameField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte num
        {
            get
            {
                return this.numField;
            }
            set
            {
                this.numField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte map
        {
            get
            {
                return this.mapField;
            }
            set
            {
                this.mapField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public ushort id
        {
            get
            {
                return this.idField;
            }
            set
            {
                this.idField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte class_number
        {
            get
            {
                return this.class_numberField;
            }
            set
            {
                this.class_numberField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte layer
        {
            get
            {
                return this.layerField;
            }
            set
            {
                this.layerField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte reforma
        {
            get
            {
                return this.reformaField;
            }
            set
            {
                this.reformaField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte schooltype
        {
            get
            {
                return this.schooltypeField;
            }
            set
            {
                this.schooltypeField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public ushort BackColor
        {
            get
            {
                return this.backColorField;
            }
            set
            {
                this.backColorField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public uint ForeColor
        {
            get
            {
                return this.foreColorField;
            }
            set
            {
                this.foreColorField = value;
            }
        }
    }

}