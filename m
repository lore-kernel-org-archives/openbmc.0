Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 381EA1A08A4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 08:15:52 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 13 Jan 2016 14:15:51 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 13 Jan 2016 14:15:49 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 53BBC1FF004B
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 14:03:59 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0DLFmAI27721838
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 14:15:48 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0DLFm7s020257
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 14:15:48 -0700
Received: from birb.localdomain ([9.83.3.253])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u0DLFeTs019474; Wed, 13 Jan 2016 14:15:47 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id CBB9C22B7CFE; Thu, 14 Jan 2016 08:15:37 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v4] Set Fault and Present status while
 handling fru
In-Reply-To: <1452582011-6265-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452582011-6265-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452582011-6265-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 14 Jan 2016 08:15:37 +1100
Message-ID: <871t9lchae.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011321-0013-0000-0000-00001BDB64AF
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
X-List-Received-Date: Wed, 13 Jan 2016 21:15:53 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
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

Comment is not needed, it should be obvious from member name.

> +        uint8_t iv_fruid;

What does iv_ prefix mean?

> +
> +        // Type of the fru matching offsets in common header
> +        uint8_t iv_type;

if it's a type of a limited set, should this be an enum?

> +        // If a particular area has been marked valid / invalid
> +        inline bool get_valid() const
> +        {
> +            return iv_valid;
> +        }

why not is_valid() ?

> --- a/readeeprom.C
> +++ b/readeeprom.C
> @@ -12,7 +12,7 @@ static void exit_with_error(const char* err, char** argv)
>  }
>  
>  //--------------------------------------------------------------------------
> -// This gets called by udev monitor soon after seeing hog plugs for EEPROMS. 
> +// This gets called by udev monitor soon after seeing hog plugs for EEPROMS.
>  //--------------------------------------------------------------------------

Best to do whitespace fixups in separate patch.

>  int main(int argc, char **argv)
>  {
> @@ -21,7 +21,7 @@ int main(int argc, char **argv)
>  
>      // Handle to per process system bus
>      sd_bus *bus_type = NULL;
> -    
> +

again, whitespace in sep patch

>      // Read the arguments.
>      auto cli_options = std::make_unique<ArgumentParser>(argc, argv);
>  
> @@ -53,7 +53,7 @@ int main(int argc, char **argv)
>  
>      // Get a handle to System Bus
>      rc = sd_bus_open_system(&bus_type);
> -    if (rc < 0) 
> +    if (rc < 0)

and here

> diff --git a/strgfnhandler.C b/strgfnhandler.C
> index a00688f..eda4290 100644
> --- a/strgfnhandler.C
> +++ b/strgfnhandler.C
> @@ -11,8 +11,8 @@ sd_bus* ipmid_get_sd_bus_connection(void);
>  ///-------------------------------------------------------
>  // Called by IPMI netfn router for write fru data command
>  //--------------------------------------------------------
> -ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
> -                              ipmi_request_t request, ipmi_response_t response, 
> +ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t response,
>                                ipmi_data_len_t data_len,
> ipmi_context_t context)

and here

>  {
>      FILE *fp = NULL;
> @@ -38,7 +38,7 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  
>      // On error there is no response data for this command.
>      *data_len = 0;
> -    
> +

and here

>  #ifdef __IPMI__DEBUG__
>      printf("IPMI WRITE-FRU-DATA for [%s]  Offset = [%d] Length = [%d]\n",
>              fru_file_name, offset, len);
> @@ -59,17 +59,17 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>              fclose(fp);
>              return rc;
>          }
> -    
> +
>          if(fwrite(&reqptr->data, len, 1, fp) != 1)
>          {
>              perror("Error:");
>              fclose(fp);
>              return rc;
>          }
> -    
> +
>          fclose(fp);
> -    } 
> -    else 
> +    }
> +    else

and here.

>  
> +//----------------------------------------------------------------
> +// Constructor
> +//----------------------------------------------------------------
> +ipmi_fru::ipmi_fru(const uint8_t fruid, const uint8_t type,
> +                   sd_bus *bus_type, bool bmc_fru)

The comment is redundant.

> +//-----------------------------------------------------
> +// Accepts a pointer to data and sets it in the object.
> +//-----------------------------------------------------
> +void ipmi_fru::set_data(const uint8_t *data, const size_t len)
> +{
> +    iv_len = len;
> +    iv_data = new uint8_t[len];
> +    memcpy(iv_data, data, len);
> +}

Comment would do better detailing ownership of data rather than simply
explaining what the code obviously does.

> +//-----------------------------------------------------
> +// Sets the dbus parameters
> +//-----------------------------------------------------
> +void ipmi_fru::update_dbus_paths(const char *bus_name,
> +                      const char *obj_path, const char *intf_name)
> +{
> +    iv_bus_name = bus_name;
> +    iv_obj_path = obj_path;
> +    iv_intf_name = intf_name;
> +}

why are we passing in C strings when everything else is std::string?
It's just as easy to create std::string on the way in as it is to do so
here, and if the caller is dealing with std::string, then we have more hoops

> +
> +//-------------------
> +// Destructor
> +//-------------------
> +ipmi_fru::~ipmi_fru()

redundant comment.

>  //------------------------------------------------
>  // Takes the pointer to stream of bytes and length
>  // returns the 8 bit checksum per IPMI spec.
>  //-------------------------------------------------
> -unsigned char calculate_crc(unsigned char *data, int len)
> +unsigned char calculate_crc(const unsigned char *data, size_t len)
>  {
>      char crc = 0;
> -    int byte = 0;
> +    size_t byte = 0;
>  
>      for(byte = 0; byte < len; byte++)
>      {

This should likely be a separate patch, this change seems unrelated to
the other changes.

What is the checksum anyway? Is it CRC32? A byte at a time loop is
unlikely to be the most optimal way of doing things.

-- 
Stewart Smith
OPAL Architect, IBM.
