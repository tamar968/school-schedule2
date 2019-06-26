public class XmlTeachers
{

    // NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class root
    {

        private rootData[] dataField;

        private uint school_idField;

        private string data_typeField;

        private string eG_time2Field;

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

        private string nameField;

        private rootDataDetails detailsField;

        private int numField;

        private int mapField;

        private string idField;

        private int backColorField;

        private uint foreColorField;

        private byte wantedDaysField;

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
        public rootDataDetails details
        {
            get
            {
                return this.detailsField;
            }
            set
            {
                this.detailsField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public int num
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
        public int map
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
        public string id
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
        public int BackColor
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

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte WantedDays
        {
            get
            {
                return this.wantedDaysField;
            }
            set
            {
                this.wantedDaysField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rootDataDetails
    {

        private byte goremMeshalemField;

        private bool goremMeshalemFieldSpecified;

        private byte customReformaHoursField;

        private byte status_misraField;

        private string remarkField;

        private uint phone1Field;

        private bool phone1FieldSpecified;

        private uint phone2Field;

        private bool phone2FieldSpecified;

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte goremMeshalem
        {
            get
            {
                return this.goremMeshalemField;
            }
            set
            {
                this.goremMeshalemField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool goremMeshalemSpecified
        {
            get
            {
                return this.goremMeshalemFieldSpecified;
            }
            set
            {
                this.goremMeshalemFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte customReformaHours
        {
            get
            {
                return this.customReformaHoursField;
            }
            set
            {
                this.customReformaHoursField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte status_misra
        {
            get
            {
                return this.status_misraField;
            }
            set
            {
                this.status_misraField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string remark
        {
            get
            {
                return this.remarkField;
            }
            set
            {
                this.remarkField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public uint phone1
        {
            get
            {
                return this.phone1Field;
            }
            set
            {
                this.phone1Field = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool phone1Specified
        {
            get
            {
                return this.phone1FieldSpecified;
            }
            set
            {
                this.phone1FieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public uint phone2
        {
            get
            {
                return this.phone2Field;
            }
            set
            {
                this.phone2Field = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool phone2Specified
        {
            get
            {
                return this.phone2FieldSpecified;
            }
            set
            {
                this.phone2FieldSpecified = value;
            }
        }
    }


}