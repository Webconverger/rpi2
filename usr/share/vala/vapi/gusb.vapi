/* gusb.vapi generated by vapigen-0.34, do not modify. */

[CCode (cprefix = "GUsb", gir_namespace = "GUsb", gir_version = "1.0", lower_case_cprefix = "g_usb_")]
namespace GUsb {
	[CCode (cheader_filename = "gusb.h", type_id = "g_usb_context_get_type ()")]
	public class Context : GLib.Object, GLib.Initable {
		[CCode (has_construct_function = false)]
		[Version (since = "0.1.0")]
		public Context () throws GLib.Error;
		[Version (since = "0.2.2")]
		public void enumerate ();
		[Version (since = "0.1.0")]
		public static GLib.Quark error_quark ();
		[Version (since = "0.2.2")]
		public GUsb.Device find_by_bus_address (uint8 bus, uint8 address) throws GLib.Error;
		[Version (since = "0.2.4")]
		public GUsb.Device find_by_platform_id (string platform_id) throws GLib.Error;
		[Version (since = "0.2.2")]
		public GUsb.Device find_by_vid_pid (uint16 vid, uint16 pid) throws GLib.Error;
		[Version (since = "0.2.2")]
		public GLib.GenericArray<GUsb.Device> get_devices ();
		[Version (since = "0.2.5")]
		public unowned GLib.MainContext get_main_context ();
		[Version (since = "0.1.0")]
		public unowned GUsb.Source get_source (GLib.MainContext main_ctx);
		[Version (since = "0.1.0")]
		public void set_debug (GLib.LogLevelFlags flags);
		[Version (since = "0.2.5")]
		public void set_main_context (GLib.MainContext main_ctx);
		[Version (since = "0.2.9")]
		public GUsb.Device wait_for_replug (GUsb.Device device, uint timeout_ms) throws GLib.Error;
		[NoAccessorMethod]
		public int debug_level { get; set; }
		[NoAccessorMethod]
		public void* libusb_context { get; }
		public virtual signal void device_added (GUsb.Device device);
		public virtual signal void device_removed (GUsb.Device device);
	}
	[CCode (cheader_filename = "gusb.h", type_id = "g_usb_device_get_type ()")]
	public class Device : GLib.Object, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected Device ();
		[Version (since = "0.1.0")]
		public bool bulk_transfer (uint8 endpoint, [CCode (array_length_cname = "length", array_length_pos = 2.5, array_length_type = "gsize")] uint8[] data, size_t actual_length, uint timeout, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[Version (since = "0.1.0")]
		public async ssize_t bulk_transfer_async (uint8 endpoint, [CCode (array_length_cname = "length", array_length_pos = 2.5, array_length_type = "gsize")] uint8[] data, uint timeout, GLib.Cancellable? cancellable) throws GLib.Error;
		[Version (since = "0.1.0")]
		public bool claim_interface (int @interface, GUsb.DeviceClaimInterfaceFlags flags) throws GLib.Error;
		public bool close () throws GLib.Error;
		[Version (since = "0.1.0")]
		public bool control_transfer (GUsb.DeviceDirection direction, GUsb.DeviceRequestType request_type, GUsb.DeviceRecipient recipient, uint8 request, uint16 value, uint16 idx, [CCode (array_length_cname = "length", array_length_pos = 7.5, array_length_type = "gsize")] uint8[] data, size_t actual_length, uint timeout, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[Version (since = "0.1.0")]
		public async ssize_t control_transfer_async (GUsb.DeviceDirection direction, GUsb.DeviceRequestType request_type, GUsb.DeviceRecipient recipient, uint8 request, uint16 value, uint16 idx, [CCode (array_length_cname = "length", array_length_pos = 7.5, array_length_type = "gsize")] uint8[] data, uint timeout, GLib.Cancellable? cancellable) throws GLib.Error;
		[Version (since = "0.1.0")]
		public static GLib.Quark error_quark ();
		[Version (since = "0.1.0")]
		public uint8 get_address ();
		[Version (since = "0.1.0")]
		public uint8 get_bus ();
		[Version (since = "0.2.4")]
		public GLib.GenericArray<GUsb.Device> get_children ();
		[Version (since = "0.1.0")]
		public int get_configuration () throws GLib.Error;
		[Version (since = "0.2.5")]
		public uint8 get_custom_index (uint8 class_id, uint8 subclass_id, uint8 protocol_id) throws GLib.Error;
		[Version (since = "0.1.7")]
		public uint8 get_device_class ();
		[Version (since = "0.2.4")]
		public uint8 get_device_protocol ();
		[Version (since = "0.2.4")]
		public uint8 get_device_subclass ();
		[Version (since = "0.2.8")]
		public GUsb.Interface get_interface (uint8 class_id, uint8 subclass_id, uint8 protocol_id) throws GLib.Error;
		[Version (since = "0.2.8")]
		public GLib.GenericArray<weak GUsb.Interface> get_interfaces () throws GLib.Error;
		[Version (since = "0.1.0")]
		public uint8 get_manufacturer_index ();
		[Version (since = "0.2.4")]
		public GUsb.Device get_parent ();
		[Version (since = "0.1.0")]
		public uint16 get_pid ();
		[Version (since = "0.2.4")]
		public unowned string get_pid_as_str ();
		[Version (since = "0.1.1")]
		public unowned string get_platform_id ();
		[Version (since = "0.2.4")]
		public uint8 get_port_number ();
		[Version (since = "0.1.0")]
		public uint8 get_product_index ();
		[Version (since = "0.2.8")]
		public uint16 get_release ();
		[Version (since = "0.1.0")]
		public uint8 get_serial_number_index ();
		[Version (since = "0.1.0")]
		public string get_string_descriptor (uint8 desc_index) throws GLib.Error;
		[Version (since = "0.1.0")]
		public uint16 get_vid ();
		[Version (since = "0.2.4")]
		public unowned string get_vid_as_str ();
		[Version (since = "0.1.0")]
		public bool interrupt_transfer (uint8 endpoint, [CCode (array_length_cname = "length", array_length_pos = 2.5, array_length_type = "gsize")] uint8[] data, size_t actual_length, uint timeout, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[Version (since = "0.1.0")]
		public async ssize_t interrupt_transfer_async (uint8 endpoint, [CCode (array_length_cname = "length", array_length_pos = 2.5, array_length_type = "gsize")] uint8[] data, uint timeout, GLib.Cancellable? cancellable) throws GLib.Error;
		[Version (since = "0.1.0")]
		public bool open () throws GLib.Error;
		[Version (since = "0.1.0")]
		public bool release_interface (int @interface, GUsb.DeviceClaimInterfaceFlags flags) throws GLib.Error;
		public bool reset () throws GLib.Error;
		[Version (since = "0.1.0")]
		public bool set_configuration (int configuration) throws GLib.Error;
		[Version (since = "0.2.8")]
		public bool set_interface_alt (int @interface, uint8 alt) throws GLib.Error;
		public GUsb.Context context { construct; }
		[NoAccessorMethod]
		public void* libusb_device { get; construct; }
		public string platform_id { construct; }
	}
	[CCode (cheader_filename = "gusb.h", type_id = "g_usb_device_list_get_type ()")]
	public class DeviceList : GLib.Object {
		[CCode (has_construct_function = false)]
		[Version (since = "0.1.0")]
		public DeviceList (GUsb.Context context);
		[Version (since = "0.1.0")]
		public void coldplug ();
		[Version (since = "0.1.0")]
		public GUsb.Device find_by_bus_address (uint8 bus, uint8 address) throws GLib.Error;
		[Version (since = "0.1.0")]
		public GUsb.Device find_by_vid_pid (uint16 vid, uint16 pid) throws GLib.Error;
		[Version (since = "0.1.0")]
		public GLib.GenericArray<GUsb.Device> get_devices ();
		[NoAccessorMethod]
		public GUsb.Context context { owned get; construct; }
		public virtual signal void device_added (GUsb.Device device);
		public virtual signal void device_removed (GUsb.Device device);
	}
	[CCode (cheader_filename = "gusb.h", type_id = "g_usb_interface_get_type ()")]
	public class Interface : GLib.Object {
		[CCode (has_construct_function = false)]
		protected Interface ();
		[Version (since = "0.2.8")]
		public uint8 get_alternate ();
		[Version (since = "0.2.8")]
		public uint8 get_class ();
		[Version (since = "0.2.8")]
		public unowned GLib.Bytes get_extra ();
		[Version (since = "0.2.8")]
		public uint8 get_index ();
		[Version (since = "0.2.8")]
		public uint8 get_kind ();
		[Version (since = "0.2.8")]
		public uint8 get_length ();
		[Version (since = "0.2.8")]
		public uint8 get_number ();
		[Version (since = "0.2.8")]
		public uint8 get_protocol ();
		[Version (since = "0.2.8")]
		public uint8 get_subclass ();
	}
	[CCode (cheader_filename = "gusb.h", has_type_id = false)]
	[Compact]
	public class Source {
		[Version (since = "0.1.0")]
		public void set_callback (owned GLib.SourceFunc func);
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_CONTEXT_ERROR_", has_type_id = false)]
	public enum ContextError {
		[CCode (cname = "G_USB_CONTEXT_ERROR_INTERNAL")]
		CONTEXT_ERROR_INTERNAL
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_DEVICE_CLAIM_INTERFACE_BIND_KERNEL_", has_type_id = false)]
	[Flags]
	public enum DeviceClaimInterfaceFlags {
		[CCode (cname = "G_USB_DEVICE_CLAIM_INTERFACE_BIND_KERNEL_DRIVER")]
		DEVICE_CLAIM_INTERFACE_BIND_KERNEL_DRIVER
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_DEVICE_CLASS_", has_type_id = false)]
	public enum DeviceClassCode {
		INTERFACE_DESC,
		AUDIO,
		COMMUNICATIONS,
		HID,
		PHYSICAL,
		IMAGE,
		PRINTER,
		MASS_STORAGE,
		HUB,
		CDC_DATA,
		SMART_CARD,
		CONTENT_SECURITY,
		VIDEO,
		PERSONAL_HEALTHCARE,
		AUDIO_VIDEO,
		BILLBOARD,
		DIAGNOSTIC,
		WIRELESS_CONTROLLER,
		MISCELLANEOUS,
		APPLICATION_SPECIFIC,
		VENDOR_SPECIFIC
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_DEVICE_DIRECTION_", has_type_id = false)]
	public enum DeviceDirection {
		DEVICE_TO_HOST,
		HOST_TO_DEVICE
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_DEVICE_ERROR_", has_type_id = false)]
	public enum DeviceError {
		INTERNAL,
		IO,
		TIMED_OUT,
		NOT_SUPPORTED,
		NO_DEVICE,
		NOT_OPEN,
		ALREADY_OPEN,
		CANCELLED,
		FAILED,
		PERMISSION_DENIED,
		LAST
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_DEVICE_RECIPIENT_", has_type_id = false)]
	public enum DeviceRecipient {
		DEVICE,
		INTERFACE,
		ENDPOINT,
		OTHER
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_DEVICE_REQUEST_TYPE_", has_type_id = false)]
	public enum DeviceRequestType {
		STANDARD,
		CLASS,
		VENDOR,
		RESERVED
	}
	[CCode (cheader_filename = "gusb.h", cprefix = "G_USB_SOURCE_ERROR_")]
	public errordomain SourceError {
		[CCode (cname = "G_USB_SOURCE_ERROR_INTERNAL")]
		SOURCE_ERROR_INTERNAL;
		[Version (since = "0.1.0")]
		public static GLib.Quark quark ();
	}
	[CCode (cheader_filename = "gusb.h", cname = "G_USB_MAJOR_VERSION")]
	public const int MAJOR_VERSION;
	[CCode (cheader_filename = "gusb.h", cname = "G_USB_MICRO_VERSION")]
	public const int MICRO_VERSION;
	[CCode (cheader_filename = "gusb.h", cname = "G_USB_MINOR_VERSION")]
	public const int MINOR_VERSION;
	[CCode (cheader_filename = "gusb.h")]
	public static unowned string strerror (int error_code);
}
