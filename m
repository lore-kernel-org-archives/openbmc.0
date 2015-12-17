Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 507AD1A11B7
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 09:47:30 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 17 Dec 2015 15:47:27 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 17 Dec 2015 15:47:26 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 1ABCC1FF0045
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 15:35:37 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBHMlQ1N17957096
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 15:47:26 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBHMlPtr016717
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 15:47:25 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBHMlN6T016631; Thu, 17 Dec 2015 15:47:23 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 3613D22B7CFE; Fri, 18 Dec 2015 09:47:21 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v4 2/2] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <1450315225-22284-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450315225-22284-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450315225-22284-3-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 18 Dec 2015 09:47:21 +1100
Message-ID: <87lh8s66bq.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121722-0009-0000-0000-000010A9642B
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
X-List-Received-Date: Thu, 17 Dec 2015 22:47:31 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> diff --git a/chassishandler.C b/chassishandler.C
> index 1389db9..35b5086 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -9,6 +9,217 @@ const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
>  const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
>  const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
>  
> +// Host settings in dbus
> +// Service name should be referenced by connection name got via object mapper
> +// const char  *settings_service_name =  "org.openbmc.settings.Host";
> +const char  *settings_object_name  =  "/org/openbmc/settings/host0";
> +const char  *settings_intf_name    =  "org.freedesktop.DBus.Properties";
> +
> +const char  *objmapper_service_name =  "org.openbmc.objectmapper";
> +const char  *objmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
> +const char  *objmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
> +
> +char* uint8_to_char(uint8_t *a, size_t size)
> +{
> +    char* buffer;
> +    int i;
> +
> +    buffer = (char*)malloc(size * 2 + 1);
> +    if (!buffer)
> +        return NULL;
> +
> +    buffer[size * 2] = 0;
> +    for (i = 0; i < size; i++) {
> +        uint8_t msb = (a[i] >> 4) & 0xF;
> +        uint8_t lsb = a[i] & 0xF;
> +        buffer[2*i] = msb > 9 ? msb + 'A' - 10 : msb + '0';
> +        buffer[2*i + 1] = lsb > 9 ? lsb + 'A' - 10 : lsb + '0';
> +    }
> +
> +    return buffer;
> +}
> +
> +uint8_t* char_to_uint8(char *a, size_t size)
> +{
> +    uint8_t* buffer;
> +    int i;
> +
> +    buffer = (uint8_t*)malloc(size);
> +    if (!buffer)
> +        return NULL;
> +
> +    for (i = 0; i < size; i++) {
> +        uint8_t msb = (uint8_t)(a[2*i] > '9' ? a[2*i] - 'A' + 10 : a[2*i] - '0');
> +        uint8_t lsb = (uint8_t)(a[2*i+1] > '9' ? a[2*i+1] - 'A' + 10 : a[2*i+1] - '0');
> +        buffer[i] = ((msb << 4) | (lsb & 0xF)) & 0xFF;
> +    }
> +
> +    return buffer;
> +}

Use libc.
