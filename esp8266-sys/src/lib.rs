#![no_std]
#![allow(non_upper_case_globals)]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]

pub mod std {
    pub use core::*;
    pub mod os {
        pub mod raw {
            pub enum c_void {}
            pub type c_uchar = u8;
            pub type c_schar = i8;
            pub type c_char = i8;
            pub type c_short = i16;
            pub type c_ushort = u16;
            pub type c_int = i32;
            pub type c_uint = u32;
            pub type c_long = i32;
            pub type c_ulong = u32;
            pub type c_longlong = i64;
            pub type c_ulonglong = u64;
        }
    }
}

include!("bindings.rs");

pub type portTickType = TickType_t;
pub const configTICK_RATE_HZ: portTickType = CONFIG_FREERTOS_HZ;
pub const portTICK_PERIOD_MS: portTickType = (1_000 as portTickType) / configTICK_RATE_HZ;
pub const portTICK_RATE_MS: portTickType = portTICK_PERIOD_MS;
