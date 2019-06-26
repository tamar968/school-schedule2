
// NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
public class XmlGroups
{

    // NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class root
    {

        private rootGroup[] groupField;

        private uint school_idField;

        private string data_typeField;

        private string eG_time66Field;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("group")]
        public rootGroup[] group
        {
            get
            {
                return this.groupField;
            }
            set
            {
                this.groupField = value;
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
        public string EG_time66
        {
            get
            {
                return this.eG_time66Field;
            }
            set
            {
                this.eG_time66Field = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rootGroup
    {

        private rootGroupCls[] classesField;

        private ushort numField;

        private ushort mapField;

        private short teaField;

        private short subjField;

        private string subjlevelField;

        private short sroomField;

        private byte edgh_flagField;

        private byte no_of_hoursField;

        private byte groupedField;

        private sbyte blockidField;

        private string groupNameField;

        private sbyte sugField;

        private sbyte sub_sugField;

        private sbyte goremMeshalemField;

        private byte schooltypeField;

        private bool schooltypeFieldSpecified;

        private sbyte reformaField;

        private string mispar_sheelonField;

        private string mispar_rashiField;

        private decimal calculate_hoursField;

        private bool calculate_hoursFieldSpecified;

        private sbyte sibaField;

        private byte tkufaField;

        private bool tkufaFieldSpecified;

        private string from_dateField;

        private string to_dateField;

        private byte aField;

        private bool aFieldSpecified;

        /// <remarks/>
        [System.Xml.Serialization.XmlArrayItemAttribute("cls", IsNullable = false)]
        public rootGroupCls[] classes
        {
            get
            {
                return this.classesField;
            }
            set
            {
                this.classesField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public ushort num
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
        public ushort map
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
        public short tea
        {
            get
            {
                return this.teaField;
            }
            set
            {
                this.teaField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public short subj
        {
            get
            {
                return this.subjField;
            }
            set
            {
                this.subjField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string subjlevel
        {
            get
            {
                return this.subjlevelField;
            }
            set
            {
                this.subjlevelField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public short sroom
        {
            get
            {
                return this.sroomField;
            }
            set
            {
                this.sroomField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte edgh_flag
        {
            get
            {
                return this.edgh_flagField;
            }
            set
            {
                this.edgh_flagField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte no_of_hours
        {
            get
            {
                return this.no_of_hoursField;
            }
            set
            {
                this.no_of_hoursField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte grouped
        {
            get
            {
                return this.groupedField;
            }
            set
            {
                this.groupedField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public sbyte blockid
        {
            get
            {
                return this.blockidField;
            }
            set
            {
                this.blockidField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string groupName
        {
            get
            {
                return this.groupNameField;
            }
            set
            {
                this.groupNameField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public sbyte sug
        {
            get
            {
                return this.sugField;
            }
            set
            {
                this.sugField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public sbyte sub_sug
        {
            get
            {
                return this.sub_sugField;
            }
            set
            {
                this.sub_sugField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public sbyte goremMeshalem
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
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool schooltypeSpecified
        {
            get
            {
                return this.schooltypeFieldSpecified;
            }
            set
            {
                this.schooltypeFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public sbyte reforma
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
        public string mispar_sheelon
        {
            get
            {
                return this.mispar_sheelonField;
            }
            set
            {
                this.mispar_sheelonField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string mispar_rashi
        {
            get
            {
                return this.mispar_rashiField;
            }
            set
            {
                this.mispar_rashiField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public decimal calculate_hours
        {
            get
            {
                return this.calculate_hoursField;
            }
            set
            {
                this.calculate_hoursField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool calculate_hoursSpecified
        {
            get
            {
                return this.calculate_hoursFieldSpecified;
            }
            set
            {
                this.calculate_hoursFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public sbyte siba
        {
            get
            {
                return this.sibaField;
            }
            set
            {
                this.sibaField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte tkufa
        {
            get
            {
                return this.tkufaField;
            }
            set
            {
                this.tkufaField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool tkufaSpecified
        {
            get
            {
                return this.tkufaFieldSpecified;
            }
            set
            {
                this.tkufaFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string from_date
        {
            get
            {
                return this.from_dateField;
            }
            set
            {
                this.from_dateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string to_date
        {
            get
            {
                return this.to_dateField;
            }
            set
            {
                this.to_dateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public byte A
        {
            get
            {
                return this.aField;
            }
            set
            {
                this.aField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool ASpecified
        {
            get
            {
                return this.aFieldSpecified;
            }
            set
            {
                this.aFieldSpecified = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rootGroupCls
    {

        private byte numField;

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
    }


}