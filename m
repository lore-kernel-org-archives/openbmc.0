Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C0D4A1A0060
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:34:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=UWW6EhO7; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id q6so2555723pav.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2016 21:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/QDWEMI0ZeatjSFXwTssTalF/G2oCqN0QEqbQGB2T/E=;
 b=UWW6EhO7II5QNJEfitU3eJNWyf1NN5zC/2WVBOICjqHkecJXNsr5+GYXqfctgXVwSI
 BNlUkMdT3J073a3qNBuFgScDaKrHwtNRJwupp5ObuGpiWvBnDE7ID5wUq7gfXuKwEj80
 5Xjir+Ftn9eO2CSd1/PDjzA1f09wAbA4UYQhgzKcCiQffOIqedeRRNdkuFFwxS0V8SjD
 jZUhVaVJhRDlR84BaT41TJm9c9i3LGQI4NoP/AhZBGL1dDxk06dR0JbMDjbC8TC77N55
 AFJJ1ccy9i3qXlnZNCQZ3vazRVZaVkuZOoZhAqyAl1f+97QcBwcsg3k3n6HEDAszdCOV
 69IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/QDWEMI0ZeatjSFXwTssTalF/G2oCqN0QEqbQGB2T/E=;
 b=fGcstiVC609isj/3Ny/85f1Q96Byuo3h0dGpe25SXbrkxldiNeDL0hsAe4v/pPv5qI
 qOhuolGkoqKlXaZDjaYP8fq/0+Rhf8i01LwTJB3BMaiykKtbNUf2HDTbXFOg+lpKwhVM
 29wYfc5gHi1HKySVVH3MehxhdrhgdXmdGvNkWo/2sbE+Wntk2yWpsTafPlwWTkLwAXgF
 qwyPdqUJYOMs5GtrLZXaJUQ9Yn4lLuYN3sNvpWLFfFnQtgI1UKYJ8Qbu4qN7MkWDWHh+
 28cbv/62vILw25bT209QKIwl+viuK0PjCidoPAVAvH4bYFHWGFOFYuBibZvm3niiD4ds
 UScw==
X-Gm-Message-State: AD7BkJLDaJ5II0i/iSrktZcksWRPfoFeeuE1DU37VWDjzctqc59D7T9LML65rIyfaCu6Rw==
X-Received: by 10.66.61.204 with SMTP id s12mr48312503par.108.1457501684971;
 Tue, 08 Mar 2016 21:34:44 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i9sm8786649pfi.95.2016.03.08.21.34.42
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 08 Mar 2016 21:34:44 -0800 (PST)
Date: Wed, 9 Mar 2016 16:34:35 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: anoo@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openpower-host-ipmi-oem] Add IPMI interface to allow FW
 updates from Host
Message-ID: <20160309163435.220afa51@camb691>
In-Reply-To: <1457115626-18686-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457115626-18686-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457115626-18686-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Wed, 09 Mar 2016 05:34:47 -0000

On Fri,  4 Mar 2016 12:20:26 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> New OEM IPMI command to execute commands that would allow the Host to have access to the BMC to perform a FW update.
> ---
>  Makefile     |  2 +-
>  oemhandler.C | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  oemhandler.h |  1 +
>  3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index eaa7324..bacdef9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -10,7 +10,7 @@ CXXFLAGS += -fPIC -Wall
>  all:  $(LIB_OEM)
>  
>  %.o: %.C
> -	$(CXX) -c $< $(CXXFLAGS) -o $@
> +	$(CXX) -std=c++14 -c $< $(CXXFLAGS) -o $@
>  

This isn't a CXXFLAGS thing?

>  $(LIB_OEM): $(LIB_OEM_OBJ)
>  	$(CXX) $^ -shared $(LDFLAGS) -o $@
> diff --git a/oemhandler.C b/oemhandler.C
> index f577d67..22452d6 100644
> --- a/oemhandler.C
> +++ b/oemhandler.C
> @@ -1,7 +1,9 @@
>  #include "oemhandler.h"
>  #include <host-ipmid/ipmid-api.h>
> +#include <fstream>
>  #include <stdio.h>
>  #include <string.h>
> +#include <systemd/sd-bus.h>
>  
>  void register_netfn_oem_partial_esel() __attribute__((constructor));
>  
> @@ -70,10 +72,60 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  	return rc;
>  }
>  
> +// Prepare for FW Update.
> +// Execute needed commands to prepare the system for a fw update from the host.
> +ipmi_ret_t ipmi_ibm_oem_prep_fw_update(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                                     ipmi_request_t request, ipmi_response_t response,
> +                                     ipmi_data_len_t data_len, ipmi_context_t context)
> +{
> +    ipmi_ret_t ipmi_rc = IPMI_CC_OK;
> +    *data_len = 0;
> +
> +    int rc = 0;
> +    std::ofstream rwfs_file;
> +    const char  *busname = "org.openbmc.control.Bmc";
> +    const char  *objname = "/org/openbmc/control/bmc0";
> +    const char  *iface = "org.openbmc.control.Bmc";
> +    sd_bus *bus = ipmid_get_sd_bus_connection();
> +    sd_bus_message *reply = NULL;
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    int r = 0;
> +
> +    // Set one time flag
> +    rc = system("fw_setenv openbmconce copy-files-to-ram copy-base-filesystem-to-ram");
> +    rc = WEXITSTATUS(rc);
> +    if (rc != 0) {
> +        fprintf(stderr, "fw_setenv openbmconce failed with rc=%d\n", rc);
> +        return IPMI_CC_UNSPECIFIED_ERROR; 
> +    }
> +
> +    // Touch the image-rwfs file to perform an empty update to force the save
> +    // in case we're already in ram and the flash is the same causing the ram files
> +    // to not be copied back to flash
> +    rwfs_file.open("/run/initramfs/image-rwfs", std::ofstream::out | std::ofstream::app);
> +    rwfs_file.close();
> +
> +    // Reboot the BMC for settings to take effect
> +    r = sd_bus_call_method(bus, busname, objname, iface,
> +                           "warmReset", &error, &reply, NULL);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to reset BMC: %s\n", strerror(-r));
> +        return -1;
> +    }
> +    printf("Warning: BMC is going down for reboot!\n");
> +    sd_bus_error_free(&error);
> +    reply = sd_bus_message_unref(reply);
> +
> +    return ipmi_rc;
> +}
>  
>  void register_netfn_oem_partial_esel()
>  {
>  	printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD_PESEL);
>  	ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
> +
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_OEM, IPMI_CMD_PREP_FW_UPDATE);
> +    ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PREP_FW_UPDATE, NULL, ipmi_ibm_oem_prep_fw_update);
> +
>  	return;
>  }
> diff --git a/oemhandler.h b/oemhandler.h
> index 9cc397f..71ae01c 100644
> --- a/oemhandler.h
> +++ b/oemhandler.h
> @@ -8,6 +8,7 @@
>  // IPMI commands for net functions.
>  enum ipmi_netfn_oem_cmds
>  {
> +    IPMI_CMD_PREP_FW_UPDATE = 0x10,
>      IPMI_CMD_PESEL = 0xF0,
>  };
>  
