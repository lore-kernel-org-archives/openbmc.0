Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22d.google.com (mail-ob0-x22d.google.com
 [IPv6:2607:f8b0:4003:c01::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CC96E1A047B
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 15:48:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=DlrIfqeN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=VSePwzjQ; 
 dkim-atps=neutral
Received: by obbrx8 with SMTP id rx8so56344960obb.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 21:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XzHT7ftUe9mKA9yIoUU/zF2opMlKiMa6kGG6NtCLABs=;
 b=DlrIfqeNaDc5/6KjDeqPuPdrxesIRgN5PeLaAAUAUG/xdr7AmRO1Njn+3w2jKK2t8G
 3te+qQizK04UiM/4SeZ/YRpgT1lu1+ofxuCPekaylLGPdYQfK1Q38Z1MH7DpEmcW2v53
 34Z3Qb9yajFTaFbsixCkdF1dhPJ6wFzfKC1fjdtll4HtrbiK/Vug87MNttJPjSfxZVV9
 qq0DEXhXclo4HOkbGF9gWlABo+4+I+Q0j8edPGk/jLF87VmRmkmDLlVjBlBeOxFwyofr
 fmF1OTiE6Az+x40+UK7ZTYfy9lWVozqs0szMky4aOKtZ+ZF6CBCUhZ5TR8l3TzBdpiKv
 yYmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=XzHT7ftUe9mKA9yIoUU/zF2opMlKiMa6kGG6NtCLABs=;
 b=VSePwzjQbPHFwlQMDeW8jSCGIuCtKLNwLzTXGo95wF5pByuRvMlDLlZo4iNQg83zIt
 GFFzorWZ/1BW5mOYOGYfMYdNjUgYF29/bEGpUfq3DKBDqxUPsVU2QlB+WaFQZBUnA+WV
 +k+86eb+xQvO7LBipCNBIxnXOkGNE+ar0G4NI=
X-Received: by 10.182.20.162 with SMTP id o2mr2108166obe.35.1444884522489;
 Wed, 14 Oct 2015 21:48:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Wed, 14 Oct 2015 21:48:23 -0700 (PDT)
In-Reply-To: <1444832603-18260-2-git-send-email-patches@stwcx.xyz>
References: <1444832603-18260-1-git-send-email-patches@stwcx.xyz>
 <1444832603-18260-2-git-send-email-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Oct 2015 15:18:23 +1030
X-Google-Sender-Auth: m4F5iXSu7YdWwyFU3Vh3jmjwb_0
Message-ID: <CACPK8XcOuFn6OewUvYHtFmeTAuWpDY5S1nygqgnpb7G0DQUL9w@mail.gmail.com>
Subject: Re: [PATCH openpower-host-ipmi-oem 1/2] Support OpenPOWERs OEM
 commands on openbmc
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 15 Oct 2015 04:48:45 -0000

Hi Chris,

I had a bunch of questions from reading your code. Please see below.

On Thu, Oct 15, 2015 at 12:53 AM, OpenBMC Patches <patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> ---
>  Makefile     | 21 ++++++++++++++
>  ipmid-api.h  | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  oemhandler.C | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  oemhandler.h | 32 +++++++++++++++++++++
>  4 files changed, 228 insertions(+)
>  create mode 100644 Makefile
>  create mode 100644 ipmid-api.h
>  create mode 100644 oemhandler.C
>  create mode 100644 oemhandler.h
>
> diff --git a/Makefile b/Makefile
> new file mode 100644
> index 0000000..f495d94
> --- /dev/null
> +++ b/Makefile
> @@ -0,0 +1,21 @@
> +CXX ?= $(CROSS_COMPILE)g++
> +
> +LIB_OEM_OBJ = oemhandler.o
> +LIB_OEM     = liboemhandler.so
> +
> +INC_FLAG += -I. -O2 --std=gnu++11

What does INC_FLAG mean? I suggest using CXXFLAGS for your C++ flags.
You can include the -fpic as well.

We should be building with -Wall enabled too.

> +LIB_FLAG += -rdynamic

I'd call this LDFLAGS, as that is what it is. You can add the -shared as well.

> +
> +
> +all: $(LIB_OEM)
> +
> +%.o: %.C
> +       $(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@

IPMID_PATH does not appear to be defined.

This rule is implict, if you use the names I suggested above. You can
omit it and the makefile will still do the same thing.

> +
> +
> +$(LIB_OEM): $(LIB_OEM_OBJ)
> +       $(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
> +
> +
> +clean:
> +       rm -f *.o *.so

perhaps this:

 clean:
           $(RM) $(LIB_OEM_OBJ) $(LIB_OEM)

> diff --git a/ipmid-api.h b/ipmid-api.h
> new file mode 100644
> index 0000000..ef2be38
> --- /dev/null
> +++ b/ipmid-api.h
> @@ -0,0 +1,83 @@
> +#ifndef __HOST_IPMID_IPMI_COMMON_H__
> +#define __HOST_IPMID_IPMI_COMMON_H__

I'd expect the guard to be #define IPMID_API_H?

> +#include <stdlib.h>
> +
> +// length of Completion Code and its ALWAYS _1_
> +#define IPMI_CC_LEN 1
> +
> +// IPMI Net Function number as specified by IPMI V2.0 spec.
> +// Example :
> +// NETFUN_APP      =   (0x06 << 2),
> +typedef unsigned char   ipmi_netfn_t;
> +
> +// IPMI Command for a Net Function number as specified by IPMI V2.0 spec.
> +typedef unsigned char   ipmi_cmd_t;
> +
> +// Buffer containing data from sender of netfn and command as part of request
> +typedef void*           ipmi_request_t;

Is there much value in these typedefs? I think the obscure what's
going on in the functions below.

> +// This is the response buffer that the provider of [netfn,cmd] will send back
> +// to the caller. Provider will allocate the memory inside the handler and then
> +// will do a memcpy to this response buffer and also will set the data size
> +// parameter to the size of the buffer.
> +// EXAMPLE :
> +// unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
> +// *data_len = 6;
> +// memcpy(response, &str, *data_len);
> +typedef void*           ipmi_response_t;
> +
> +// This buffer contains any *user specific* data that is of interest only to the
> +// plugin. For a ipmi function router, this data is opaque. At the time of
> +// registering the plugin handlers, plugin may optionally allocate a memory and
> +// fill in whatever needed that will be of help during the actual handling of
> +// command. IPMID will just pass the netfn, cmd and also this data to plugins
> +// during the command handler invocation.
> +typedef void*           ipmi_context_t;
> +
> +// Length of request / response buffer depending on whether the data is a
> +// request or a response from a plugin handler.
> +typedef size_t*   ipmi_data_len_t;
> +
> +// Plugin function return the status code
> +typedef unsigned char ipmi_ret_t;

I do not think this is necessary. We can just return a uint8_t.

> +
> +// This is the callback handler that the plugin registers with IPMID. IPMI
> +// function router will then make a call to this callback handler with the
> +// necessary arguments of netfn, cmd, request, response, size and context.
> +typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
> +                                       ipmi_response_t, ipmi_data_len_t, ipmi_context_t);
> +
> +// This is the constructor function that is called into by each plugin handlers.
> +// When ipmi sets up the callback handlers, a call is made to this with
> +// information of netfn, cmd, callback handler pointer and context data.
> +// Making this a extern "C" so that plugin libraries written in C can also use
> +// it.
> +extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
> +                                       ipmi_context_t, ipmid_callback_t);
> +
> +// These are the command network functions, the response
> +// network functions are the function + 1. So to determine
> +// the proper network function which issued the command
> +// associated with a response, subtract 1.
> +// Note: these are also shifted left to make room for the LUN.
> +enum ipmi_net_fns
> +{
> +    NETFUN_OEM_IBM  =   (0x32 << 2)
> +};
> +
> +// IPMI commands for net functions. Since this is to be used both by the ipmi
> +// function router and also the callback handler registration function, its put
> +// in this .H file.
> +enum ipmi_netfn_wild_card_cmd
> +{
> +    IPMI_CMD_WILDCARD       = 0xFF,
> +};
> +
> +// Return codes from a IPMI operation as needed by IPMI V2.0 spec.
> +enum ipmi_return_codes
> +{
> +    IPMI_CC_OK = 0x00,
> +    IPMI_CC_INVALID = 0xC1
> +};
> +
> +#endif
> diff --git a/oemhandler.C b/oemhandler.C
> new file mode 100644
> index 0000000..c4eae21
> --- /dev/null
> +++ b/oemhandler.C
> @@ -0,0 +1,92 @@
> +#include "oemhandler.h"
> +#include "ipmid-api.h"
> +#include <stdio.h>
> +#include <string.h>
> +
> +void register_netfn_oem_partial_esel() __attribute__((constructor));
> +
> +
> +

Why the extra whitespace?

> +const char *g_esel_path = "/tmp/";

Can we come up with something better than sticking files in /tmp?

> +uint16_t g_record_id = 0x0100;
> +
> +

Whitespace.

> +#define LSMSSWAP(x,y) (y<<8|x)
> +
> +

Whitespace.

> +///////////////////////////////////////////////////////////////////////////////

I don't think this is necessary.

> +// For the First partial add eSEL the SEL Record ID and offset
> +// value should be 0x0000. The extended data needs to be in
> +// the form of an IPMI SEL Event Record, with Event sensor type
> +// of 0xDF and Event Message format of 0x04. The returned
> +// Record ID should be used for all partial eSEL adds.
> +//
> +// This function creates a /tmp/esel# file to store the
> +// incoming partial esel.  It is the role of some other
> +// function to commit the error log in to long term
> +// storage.  Likely via the ipmi add_sel command.

Do we really need to write this out as a file? Should it not be passed
to the program that is going to commit it to long term storage?

> +///////////////////////////////////////////////////////////////////////////////
> +ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t response,
> +                              ipmi_data_len_t data_len, ipmi_context_t context)
> +{
> +    esel_request_t *reqptr = (esel_request_t*) request;
> +    FILE *fp;
> +    char string[32];
> +    short offset = 0, record=0;
> +    unsigned short rlen;
> +    ipmi_ret_t rc = IPMI_CC_OK;
> +    char iocmd[4];
> +
> +    strcpy(string, g_esel_path);

Why the strcpy? You could just use g_esel_path as the first string below.

> +
> +    offset = LSMSSWAP(reqptr->offsetls, reqptr->offsetms);
> +
> +    sprintf(string, "%s%s%02x%02x", string, "esel", reqptr->selrecordms, reqptr->selrecordls);

snprintf.

Are selrecordms and selrecordls unique for every SEL? How will this
code behave if we get two SELs at the same time?

> +
> +
> +    // Length is the number of request bytes minus the header itself.
> +    // The header contains an extra byte to indicate the start of
> +    // the data (so didn't need to worry about word/byte boundaries)
> +    // hence the -1...
> +    rlen = ((unsigned short)*data_len) - (sizeof(esel_request_t));

Why make data_len a size_t if we're just going to cast it away?

> +
> +
> +    printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
> +        string, offset, rlen);
> +
> +    if (offset == 0) {
> +        strcpy(iocmd, "wb");
> +    } else {
> +        // I was thinking "ab+" but it appears it doesn't
> +        // do what fseek asks.  Modify to rb+ and fseek
> +        // works great...
> +        strcpy(iocmd, "rb+");

Could you just have a pointer, instead of copying memory around?

> +    }
> +
> +    if ((fp = fopen(string, iocmd)) != NULL) {
> +        fseek(fp, offset, SEEK_SET);
> +        fwrite(reqptr+1,rlen,1,fp);

Do we care about how much data is written?

> +        fclose(fp);
> +
> +

Whitespace.

> +        *data_len = sizeof(g_record_id);
> +        memcpy(response, &g_record_id, *data_len);
> +
> +

Whitespace

> +    } else {
> +        fprintf(stderr, "Error trying to perform %s for esel%s\n",iocmd, string);
> +        ipmi_ret_t rc = IPMI_CC_INVALID;
> +        *data_len     = 0;
> +    }
> +
> +    return rc;
> +}
> +
> +

Whitespace.

> +void register_netfn_oem_partial_esel()
> +{
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM_IBM, IPMI_CMD_PESEL);
> +    ipmi_register_callback(NETFUN_OEM_IBM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
> +    return;
> +}
> diff --git a/oemhandler.h b/oemhandler.h
> new file mode 100644
> index 0000000..c176fd6
> --- /dev/null
> +++ b/oemhandler.h
> @@ -0,0 +1,32 @@
> +#ifndef __HOST_IPMI_OPENPOWEROEM_HANDLER_H__
> +#define __HOST_IPMI_OPENPOWEROEM_HANDLER_H__
> +
> +#include <stdint.h>
> +#include "ipmid-api.h"
> +
> +// IPMI commands for net functions.
> +enum ipmi_netfn_oem_cmds
> +{
> +    IPMI_CMD_PESEL = 0xF0,
> +};
> +
> +
> +

Whitespace.

> +ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t response,
> +                              ipmi_data_len_t data_len, ipmi_context_t context);
> +
> +
> +struct esel_request_t {
> +    uint8_t  residls;
> +    uint8_t  residms;
> +    uint8_t  selrecordls;
> +    uint8_t  selrecordms;
> +    uint8_t  offsetls;
> +    uint8_t  offsetms;
> +    uint8_t  progress;
> +}  __attribute__ ((packed)) ;

Why the attribute?

> +
> +
> +
> +#endif
> --
> 2.6.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
