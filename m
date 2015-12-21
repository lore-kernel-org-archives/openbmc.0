Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x22e.google.com (mail-pa0-x22e.google.com
 [IPv6:2607:f8b0:400e:c03::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B77461A1615
 for <openbmc@lists.ozlabs.org>; Mon, 21 Dec 2015 12:51:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vATy7l+n; 
 dkim-atps=neutral
Received: by mail-pa0-x22e.google.com with SMTP id wq6so90626871pac.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Dec 2015 17:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=bWZnRIlDoYTaIfpmcGf/JpoRWy8yRFD/N4qEgJ/H/50=;
 b=vATy7l+nbeo1qFDyE7ARz0+8hV3IQsY1iuKOS+5WdObT0DYVnLlw0VRoyhEPfUtCAe
 FL1mkwgh0zTrLpOkbyymWrNQDa6esE6b4tx09KbqCvl6/SCm1unQQ6vKwMzdoFNdxrim
 +UDnZwcuierdnsy9SRIZNLvy8WUgzIsT11Nyt62Rt65Lr83TmvWl0K1QudFdinAnYO+G
 oZ3tFZt8jSNtfD6WwEgPdeD7mBYPo0rIE6C7jntVG0h2s79uUptkryZ0YXCkHzmi40zM
 nlLY2HArbWbcbQlq+a27mko16CGR7bZxvgI2V05aibwVcVWR19MFPMlaUW72R/IkYVDo
 PMtA==
X-Received: by 10.66.216.7 with SMTP id om7mr23172366pac.90.1450662673450;
 Sun, 20 Dec 2015 17:51:13 -0800 (PST)
Received: from camb691 (c220-239-107-234.belrs4.nsw.optusnet.com.au.
 [220.239.107.234])
 by smtp.gmail.com with ESMTPSA id cn1sm30191330pad.11.2015.12.20.17.51.11
 (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 20 Dec 2015 17:51:13 -0800 (PST)
Date: Mon, 21 Dec 2015 12:51:14 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v3] Set Fault and Present status while
 handling fru
Message-ID: <20151221125114.22d167a7@camb691>
In-Reply-To: <1450430409-11751-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450430409-11751-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450430409-11751-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.0 (GTK+ 2.24.28; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Dec 2015 01:51:16 -0000

On Fri, 18 Dec 2015 03:20:09 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: vishwa <vishwanath@in.ibm.com>
> 

A description of what is going on might be nice. It is also helpful to add a
description of what changed from the previous version.

Stewart responded with some comments on v2 and it looks like they've been
entirely ignored, please address Stewarts points from v2.

> ---
>  fru-area.H      | 153 ++++++++++++
>  readeeprom.C    |   9 +-
>  strgfnhandler.C |  21 +-
>  writefrudata.C  | 759 ++++++++++++++++++++++++++++++++++++--------------------
>  writefrudata.H  |  23 +-
>  5 files changed, 669 insertions(+), 296 deletions(-)
>  create mode 100644 fru-area.H
> 
> diff --git a/fru-area.H b/fru-area.H
> new file mode 100644
> index 0000000..90dd92b
> --- /dev/null
> +++ b/fru-area.H
> @@ -0,0 +1,153 @@
> +#ifndef __IPMI_FRU_AREA_H__
> +#define __IPMI_FRU_AREA_H__
> +
> +#include <stdint.h>
> +#include <stddef.h>
> +#include <systemd/sd-bus.h>
> +#include <string>
> +#include <vector>
> +#include <memory>
> +#include "writefrudata.H"
> +
> +class ipmi_fru;
> +typedef std::vector<std::unique_ptr<ipmi_fru>> fru_area_vec_t;
> +
> +class ipmi_fru
> +{
> +    private:
> +        // FRU ID
> +        uint8_t iv_fruid;
> +
> +        // Type of the fru matching offsets in common header
> +        uint8_t iv_type;
> +
> +        // Name of the fru area. ( BOARD/CHASSIS/PRODUCT )
> +        std::string iv_name;
> +
> +        // Length of a specific fru area.
> +        size_t  iv_len;
> +
> +        // Special bit for BMC readable eeprom only.
> +        bool iv_bmc_fru;
> +
> +        // If a FRU is physically present.
> +        bool iv_present;
> +
> +        // Whether a particular area is valid ?
> +        bool iv_valid;
> +
> +        // Actual area data.
> +        uint8_t *iv_data;
> +
> +        // fru inventory dbus name
> +        std::string iv_bus_name;
> +
> +        // fru inventory dbus object path
> +        std::string iv_obj_path;
> +
> +        // fru inventory dbus interface name
> +        std::string iv_intf_name;
> +
> +        // sd_bus handle
> +        sd_bus *iv_bus_type;
> +
> +        // Default constructor disabled.
> +        ipmi_fru();
> +
> +    public:
> +        // constructor
> +        ipmi_fru(const uint8_t fruid, const uint8_t type,
> +                 sd_bus *bus_type, bool bmc_fru = false);
> +
> +        // Destructor
> +        virtual ~ipmi_fru();
> +
> +        // If a particular area has been marked valid / invalid
> +        inline bool get_valid() const
> +        {
> +            return iv_valid;
> +        }
> +
> +        // Sets the present bit
> +        inline void set_present(const bool present)
> +        {
> +            iv_present = present;
> +        }
> +
> +        // Sets the valid bit for a corresponding area.
> +        inline void set_valid(const bool valid)
> +        {
> +            iv_valid = valid;
> +        }
> +
> +        // If a particular area accessible only by BMC
> +        inline bool is_bmc_fru() const
> +        {
> +            return iv_bmc_fru;
> +        }
> +
> +        // returns fru id;
> +        uint8_t get_fruid() const
> +        {
> +            return iv_fruid;
> +        }
> +
> +        // Returns the length.
> +        size_t get_len() const
> +        {
> +            return iv_len;
> +        }
> +
> +        // Returns the type of the current fru area
> +        uint8_t get_type() const
> +        {
> +            return iv_type;
> +        }
> +
> +        // Returns the name
> +        const char *get_name() const
> +        {
> +            return iv_name.c_str();
> +        }
> +
> +        // Returns SD bus name
> +        const char *get_bus_name() const
> +        {
> +            return iv_bus_name.c_str();
> +        }
> +
> +        // Retrns SD bus object path
> +        const char *get_obj_path() const
> +        {
> +            return iv_obj_path.c_str();
> +        }
> +
> +        // Returns SD bus interface name
> +        const char *get_intf_name() const
> +        {
> +            return iv_intf_name.c_str();
> +        }
> +
> +        // Returns the data portion
> +        inline uint8_t *get_data() const
> +        {
> +           return iv_data;
> +        }
> +
> +        // Returns the bus type.
> +        inline sd_bus *get_bus_type() const
> +        {
> +            return iv_bus_type;
> +        }
> +
> +        // Sets up the sd_bus variables for the given AREA type
> +        int setup_sd_bus_paths(void);
> +
> +        // Accepts a pointer to data and sets it in the object.
> +        void set_data(const uint8_t *, const size_t);
> +
> +        // Sets the dbus parameters
> +        void update_dbus_paths(const char *, const char *, const char *);
> +};
> +
> +#endif
> diff --git a/readeeprom.C b/readeeprom.C
> index b9c6f69..b78f35e 100644
> --- a/readeeprom.C
> +++ b/readeeprom.C
> @@ -12,7 +12,7 @@ static void exit_with_error(const char* err, char** argv)
>  }
>  
>  //--------------------------------------------------------------------------
> -// This gets called by udev monitor soon after seeing hog plugs for EEPROMS. 
> +// This gets called by udev monitor soon after seeing hog plugs for EEPROMS.
>  //--------------------------------------------------------------------------
>  int main(int argc, char **argv)
>  {
> @@ -21,7 +21,7 @@ int main(int argc, char **argv)
>  
>      // Handle to per process system bus
>      sd_bus *bus_type = NULL;
> -    
> +
>      // Read the arguments.
>      auto cli_options = std::make_unique<ArgumentParser>(argc, argv);
>  
> @@ -53,7 +53,7 @@ int main(int argc, char **argv)
>  
>      // Get a handle to System Bus
>      rc = sd_bus_open_system(&bus_type);
> -    if (rc < 0) 
> +    if (rc < 0)
>      {

... unchanged ...

>          fprintf(stderr, "Failed to connect to system bus: %s\n",strerror(-rc));
>      }
> @@ -61,7 +61,8 @@ int main(int argc, char **argv)
>      {
>          // Now that we have the file that contains the eeprom data, go read it and

[snip]

>  
>  ///-----------------------------------------------------
>  // Accepts the filename and validates per IPMI FRU spec
>  //----------------------------------------------------
> -int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name, 
> -						   sd_bus *bus_type)
> +int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
> +                           sd_bus *bus_type, const bool bmc_fru)
>  {
> -    int file_size = 0;
> -    uint8_t *fru_data = NULL;
> -    int bytes_read = 0;
> -    int rc = 0;
> +    size_t data_len = 0;
> +    size_t bytes_read = 0;
> +    int rc = -1;
>  
> -    FILE *fru_file = fopen(fru_file_name,"rb");
> -    if(fru_file == NULL)
> +    // Vector that holds individual IPMI FRU AREAs. Although MULTI and INTERNAL
> +    // are not used, keeping it here for completeness.
> +    fru_area_vec_t fru_area_vec;
> +    for(uint8_t fru_entry = IPMI_FRU_INTERNAL_OFFSET;
> +        fru_entry < (sizeof(struct common_header) -2); fru_entry++)
> +    {
> +        // Create an object and push onto a vector.
> +        std::unique_ptr<ipmi_fru> fru_area = std::make_unique<ipmi_fru>
> +                         (fruid, get_fru_area_type(fru_entry), bus_type, bmc_fru);
> +
> +        // Physically being present
> +        bool present = std::ifstream(fru_file_name);
> +        fru_area->set_present(present);
> +
> +        // And update the sd_bus paths as well.
> +        fru_area->setup_sd_bus_paths();
> +        fru_area_vec.emplace_back(std::move(fru_area));
> +    }
> +
> +    FILE *fru_fp = fopen(fru_file_name,"rb");

Was changing fru_file to fru_fp absolutely necessary... I would argue fru_file
is a better name anyway, it isn't an fp. If you really must, do it in a separate
patch.

> +    if(fru_fp == NULL)
>      {
>          fprintf(stderr, "ERROR: opening:[%s]\n",fru_file_name);
>          perror("Error:");
> -        return -1;
> +        return cleanup_error(fru_fp, fru_area_vec);
>      }
>  
> -    // Get the size of the file to allocate buffer to hold the entire contents.
> -    if(fseek(fru_file, 0, SEEK_END))
> +    // Get the size of the file to see if it meets minimum requirement
> +    if(fseek(fru_fp, 0, SEEK_END))
>      {
>          perror("Error:");
> -        fclose(fru_file);
> -        return -1;
> +        return cleanup_error(fru_fp, fru_area_vec);
>      }
>  
> -    file_size = ftell(fru_file);
> -    fru_data = (uint8_t *)malloc(file_size);
> +    // Allocate a buffer to hold entire file content
> +    data_len = ftell(fru_fp);
> +    uint8_t fru_data[data_len] = {0};

Why this change? I don't think this is going to do what you want.

>  
> -    // Read entire file contents to the internal buffer
> -    if(fseek(fru_file, 0, SEEK_SET))
> +    rewind(fru_fp);
> +    bytes_read = fread(fru_data, data_len, 1, fru_fp);
> +    if(bytes_read != 1)
>      {
> +        fprintf(stderr, "Failed reading fru data. Bytes_read=[%d]\n",bytes_read);
>          perror("Error:");
> -        fclose(fru_file);
> -        return -1;
> +        return cleanup_error(fru_fp, fru_area_vec);
>      }
>  
> -    bytes_read = fread(fru_data, file_size, 1, fru_file);
> -    if(bytes_read != 1)
> +    // We are done reading.
> +    fclose(fru_fp);
> +    fru_fp = NULL;
> +
> +    rc = ipmi_validate_common_hdr(fru_data, data_len);
> +    if(rc < 0)
>      {
> -        fprintf(stderr, "ERROR reading common header. Bytes read=:[%d]\n",bytes_read);
> -        perror("Error:");
> -        fclose(fru_file);
> -        return -1;
> +        return cleanup_error(fru_fp, fru_area_vec);
>      }
> -    fclose(fru_file);
>  
> -    rc = ipmi_validate_and_update_inventory(fruid, fru_data, bus_type);
> -    if(rc == -1)
> +    // Now that we validated the common header, populate various fru sections if we have them here.
> +    rc = ipmi_populate_fru_areas(fru_data, data_len, fru_area_vec);
> +    if(rc < 0)
>      {
> -        printf("ERROR: Validation failed for:[%d]\n",fruid);
> +        fprintf(stderr,"Populating FRU areas failed for:[%d]\n",fruid);
> +        return cleanup_error(fru_fp, fru_area_vec);
>      }
>      else
>      {
> -        printf("SUCCESS: Validated:[%s]\n",fru_file_name);
> +        printf("SUCCESS: Populated FRU areas for:[%s]\n",fru_file_name);
>      }
>  
> -    if(fru_data)
> +#ifdef __IPMI_DEBUG__
> +    for(auto& iter : fru_area_vec)
>      {
> -        free(fru_data);
> -        fru_data = NULL;
> +        printf("FRU ID : [%d]\n",(iter)->get_fruid());
> +        printf("AREA NAME : [%s]\n",(iter)->get_name());
> +        printf("TYPE : [%d]\n",(iter)->get_type());
> +        printf("LEN : [%d]\n",(iter)->get_len());
> +        printf("BUS NAME : [%s]\n", (iter)->get_bus_name());
> +        printf("OBJ PATH : [%s]\n", (iter)->get_obj_path());
> +        printf("INTF NAME :[%s]\n", (iter)->get_intf_name());
>      }
> +#endif
> +
> +    // If the vector is populated with everything, then go ahead and update the
> +    // inventory.
> +    if(!(fru_area_vec.empty()))
> +    {
> +
> +#ifdef __IPMI_DEBUG__
> +        printf("\n SIZE of vector is : [%d] \n",fru_area_vec.size());
> +#endif
> +        rc = ipmi_update_inventory(fru_area_vec);
> +        if(rc <0)
> +        {
> +            fprintf(stderr, "Error updating inventory\n");
> +        }
> +    }
> +
> +    // we are done with all that we wanted to do. This will do the job of
> +    // calling any destructors too.
> +    fru_area_vec.clear();
>  
>      return rc;
>  }
> -
> diff --git a/writefrudata.H b/writefrudata.H
> index 89c20ac..c65c21b 100644
> --- a/writefrudata.H
> +++ b/writefrudata.H
> @@ -5,6 +5,10 @@
>  #include <stddef.h>
>  #include <systemd/sd-bus.h>
>  
> +#ifndef __cplusplus
> +#include <stdbool.h> // For bool variable
> +#endif
> +
>  // IPMI commands for Storage net functions.
>  enum ipmi_netfn_storage_cmds
>  {
> @@ -12,7 +16,7 @@ enum ipmi_netfn_storage_cmds
>  };
>  
>  // Format of write fru data command
> -struct write_fru_data_t 
> +struct write_fru_data_t
>  {
>      uint8_t  frunum;
>      uint8_t  offsetls;
> @@ -33,14 +37,6 @@ struct common_header
>      uint8_t crc;
>  }__attribute__((packed));
>  
> -// Contains key info about a particular area.
> -typedef struct
> -{
> -    uint8_t type;
> -    uint8_t *offset;
> -    size_t  len;
> -}__attribute__((packed)) fru_area_t;
> -
>  // first byte in header is 1h per IPMI V2 spec.
>  #define IPMI_FRU_HDR_BYTE_ZERO   1
>  #define IPMI_FRU_INTERNAL_OFFSET offsetof(struct common_header, internal_offset)
> @@ -51,6 +47,13 @@ typedef struct
>  #define IPMI_FRU_HDR_CRC_OFFSET  offsetof(struct common_header, crc)
>  #define IPMI_EIGHT_BYTES         8
>  
> -extern "C" int ipmi_validate_fru_area(const uint8_t, const char *, sd_bus *);
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +
> +int ipmi_validate_fru_area(const uint8_t, const char *, sd_bus *, const bool);
>  
> +#ifdef __cplusplus
> +} // extern C
> +#endif
>  #endif
