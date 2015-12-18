Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 759A61A1A1C
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 11:03:24 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 17 Dec 2015 19:03:20 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 17 Dec 2015 19:03:19 -0500
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 09B366E8045
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 18:51:28 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBI03IUD33423484
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 00:03:19 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBI03I6c016487
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 19:03:18 -0500
Received: from birb.localdomain ([9.192.255.109])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBI03IOx016389; Thu, 17 Dec 2015 19:03:18 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 2E2E12286E32; Fri, 18 Dec 2015 11:03:15 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v2] Set Fault and Present status while
 handling fru
In-Reply-To: <1450351209-6036-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450351209-6036-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450351209-6036-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 18 Dec 2015 11:03:15 +1100
Message-ID: <87fuz062t8.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121800-0057-0000-0000-000002EB2B86
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
X-List-Received-Date: Fri, 18 Dec 2015 00:03:25 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> --- /dev/null
> +++ b/fru-area.H
> @@ -0,0 +1,153 @@
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

These comments add no more information as the member names are obvious.

> +    public:
> +        // constructor
> +        ipmi_fru(const uint8_t fruid, const uint8_t type,
> +                 sd_bus *bus_type, bool bmc_fru = false);
> +
> +        // Destructor
> +        virtual ~ipmi_fru();

Same with these comments, obvious and not needed.

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
>          fprintf(stderr, "Failed to connect to system bus: %s\n",strerror(-rc));
>      }

Fixing whitespace should probably be a separate patch.

> @@ -61,7 +61,8 @@ int main(int argc, char **argv)
>      {
>          // Now that we have the file that contains the eeprom data, go read it and
>          // update the Inventory DB.
> -        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(), bus_type);
> +        bool bmc_fru = true;
> +        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(),
>      bus_type, bmc_fru);

Why not just pass true to the function directly?

>      }
>  
>      // Cleanup
> diff --git a/strgfnhandler.C b/strgfnhandler.C
> index 28406de..eda4290 100644
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
>                                ipmi_data_len_t data_len, ipmi_context_t context)
>  {
>      FILE *fp = NULL;
> @@ -38,7 +38,7 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  
>      // On error there is no response data for this command.
>      *data_len = 0;
> -    
> +
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
>      {

Whitespace fixes should likely be separate patch.
