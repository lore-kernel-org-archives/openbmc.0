Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x22c.google.com (mail-ob0-x22c.google.com
 [IPv6:2607:f8b0:4003:c01::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 232581A0754
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 15:20:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Nh/JLvun; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=FxWqGsmW; 
 dkim-atps=neutral
Received: by obbwb3 with SMTP id wb3so55428552obb.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 21:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=RNGRGohGMqVIahszKC6i/Tx1fQQ+Kwz2T7/Vb2Xvfpg=;
 b=Nh/JLvunWdDjowtSUNUhWQKifC9OmhMP/7T8mKOXaGmg3PhKgIEocH2vEYpiuMWWWH
 VSus7NjYRTT4PazWE+4by2yUGCGhdnXqZVieg5k2rVlvSocWgcSG9EB2wts8r7jTWsyP
 6DjCQkWvjCdviQGsmGCcyfUCv6A7/Ep40tbJ9xbFYY86T7yqhfFf/C6Hwe3IrTKJSu4Q
 kWoedA8UOQMVCEdeOK9Cdrk1j7mtD4l+J1RUOyoKsU+8HW0Y9Pfyrbp9KkfbE+0/34k8
 a/qAFgiuvJQXSnA+DuMjnpbjmcPU0NtOB8r6SvhbB5ZfHQl+z5WyN1NLTWbmiavA6/oA
 gI0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=RNGRGohGMqVIahszKC6i/Tx1fQQ+Kwz2T7/Vb2Xvfpg=;
 b=FxWqGsmWFLWjP1DOhRc0Mak96blv8XrIIi/SEYSTUVJ4JBq1MgonAsWd+9F4SG4k2B
 zpILzw7WRo6I4W/Spk2i9rYnloA4KpHCVCMYTuq1j1VULAunX7ElpLcl63o6YQiLQ6Ud
 fWh32aIlwjSuXUaxA3jAjzl6KN1lCKd/mabz4=
X-Received: by 10.182.171.2 with SMTP id aq2mr1854346obc.35.1444969233068;
 Thu, 15 Oct 2015 21:20:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Thu, 15 Oct 2015 21:20:13 -0700 (PDT)
In-Reply-To: <1444939133-32661-4-git-send-email-patches@stwcx.xyz>
References: <1444939133-32661-1-git-send-email-patches@stwcx.xyz>
 <1444939133-32661-4-git-send-email-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Oct 2015 14:50:13 +1030
X-Google-Sender-Auth: nZt0sS-YCxQQhI0AmKhZZmAFgOM
Message-ID: <CACPK8XcaM0JCtKPmz2acXQcybdX3bWGEKBcOdsvj8TUNUpQ-=g@mail.gmail.com>
Subject: Re: [PATCH openpower-host-ipmi-oem v2 3/3] Fixes from Joel review
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
X-List-Received-Date: Fri, 16 Oct 2015 04:20:36 -0000

On Fri, Oct 16, 2015 at 6:28 AM, OpenBMC Patches <patches@stwcx.xyz> wrote:
> From: Chris Austen <austenc@us.ibm.com>
>
> ---
>  Makefile     |  8 +++----
>  ipmid-api.h  |  4 ++--
>  oemhandler.C | 34 ++++++++++++++---------------
>  testit.C     | 70 ++++++++++++++++++++++++------------------------------------
>  4 files changed, 51 insertions(+), 65 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e2c405b..e2ed670 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -6,14 +6,14 @@ TESTER_OBJ  = testit.o oemhandler.o
>  LIB_OEM_OBJ = oemhandler.o
>  LIB_OEM     = liboemhandler.so
>
> -INC_FLAG += -I. -O2 --std=gnu++11
> -LIB_FLAG += -rdynamic
> +LDFLAGS += -rdynamic
> +CXXFLAGS += -fpic -Wall
>
>
>  all:  $(TESTER) $(LIB_OEM)
>
>  %.o: %.C
> -       $(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
> +       $(CXX) -fpic -c $< $(CXXFLAGS) -o $@

fpic is here twice.

Once you remove this, the rule is same as the built in rule, so you
don't need it.

>
>
>  $(LIB_OEM): $(LIB_OEM_OBJ)
> @@ -24,4 +24,4 @@ $(TESTER): $(TESTER_OBJ)
>         $(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl

LIB_FLAG does not exist anymore.

-ldl can go in the LDFLAGS.

>
>  clean:
> -       rm -f $(TESTER) *.o *.so
> +       $(RM) $(LIB_OEM_OBJ) $(LIB_OEM) $(TESTER_OBJ) $(TESTER)
> diff --git a/ipmid-api.h b/ipmid-api.h
> index ef2be38..68090f3 100644
> --- a/ipmid-api.h
> +++ b/ipmid-api.h
> @@ -1,5 +1,5 @@
> -#ifndef __HOST_IPMID_IPMI_COMMON_H__
> -#define __HOST_IPMID_IPMI_COMMON_H__
> +#ifndef __HOST_IPMID_API_COMMON_H__
> +#define __HOST_IPMID_API_COMMON_H__
>  #include <stdlib.h>
>
>  // length of Completion Code and its ALWAYS _1_
> diff --git a/oemhandler.C b/oemhandler.C
> index c4eae21..fa1b9a2 100644
> --- a/oemhandler.C
> +++ b/oemhandler.C
> @@ -5,8 +5,6 @@
>
>  void register_netfn_oem_partial_esel() __attribute__((constructor));
>
> -
> -
>  const char *g_esel_path = "/tmp/";
>  uint16_t g_record_id = 0x0100;
>
> @@ -32,39 +30,41 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  {
>      esel_request_t *reqptr = (esel_request_t*) request;
>      FILE *fp;
> -    char string[32];
> -    short offset = 0, record=0;
> -    unsigned short rlen;
> +    short offset = 0;
> +    uint8_t rlen;
>      ipmi_ret_t rc = IPMI_CC_OK;
> -    char iocmd[4];
> +    char iocmd[][4] = { { "wb" },  {"rb+"} };
> +    char string[64];
> +    char *pio;
>
> -    strcpy(string, g_esel_path);
>
>      offset = LSMSSWAP(reqptr->offsetls, reqptr->offsetms);
>
> -    sprintf(string, "%s%s%02x%02x", string, "esel", reqptr->selrecordms, reqptr->selrecordls);
> +    snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", reqptr->selrecordms, reqptr->selrecordls);
>
>
>      // Length is the number of request bytes minus the header itself.
>      // The header contains an extra byte to indicate the start of
>      // the data (so didn't need to worry about word/byte boundaries)
>      // hence the -1...
> -    rlen = ((unsigned short)*data_len) - (sizeof(esel_request_t));
> +    rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
>
>
>      printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
>          string, offset, rlen);
>
> +
> +    // Rules state for a Partial eSel that the first write of a
> +    // new esel will be the sensor data record.  We will use that
> +    // to indicate this is a new record rather then an ofset in
> +    // my next commit TODO
>      if (offset == 0) {
> -        strcpy(iocmd, "wb");
> +        pio = iocmd[0];

pio = "wb"

>      } else {
> -        // I was thinking "ab+" but it appears it doesn't
> -        // do what fseek asks.  Modify to rb+ and fseek
> -        // works great...
> -        strcpy(iocmd, "rb+");
> +        pio = iocmd[1];

pio = "rb+"

Then you can lose the char array.

>      }
>
> -    if ((fp = fopen(string, iocmd)) != NULL) {
> +    if ((fp = fopen(string, pio)) != NULL) {
>          fseek(fp, offset, SEEK_SET);
>          fwrite(reqptr+1,rlen,1,fp);
>          fclose(fp);
> @@ -75,8 +75,8 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>
>
>      } else {
> -        fprintf(stderr, "Error trying to perform %s for esel%s\n",iocmd, string);
> -        ipmi_ret_t rc = IPMI_CC_INVALID;
> +        fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, string);
> +        rc = IPMI_CC_INVALID;
>          *data_len     = 0;
>      }
>
> diff --git a/testit.C b/testit.C
> index b563257..25e069c 100644
> --- a/testit.C
> +++ b/testit.C
> @@ -4,6 +4,12 @@
>  #include "oemhandler.h"
>  #include <cstring>
>

Whitespace.

> +#include <iostream>
> +#include <fstream>
> +#include <vector>

is there any sorting here? ABC order is generally a good rule.

> +
> +using namespace std;
> +
>  const char* g_filepath = "/tmp/";
>
>  const char * getFilePath(void) {       return g_filepath; }
> @@ -12,56 +18,36 @@ const char * getFilePath(void) {    return g_filepath; }
>  #define MAXRESPONSE 2
>
>
> -// Returns the length of the file
> -size_t checkFileSize(const char *fn) {
>
> -       FILE *fp;
> -       size_t len = -1;
> -
> -    if ((fp = fopen(fn, "rb")) != NULL) {
> -        fseek(fp, 0, SEEK_END);
> -        len = ftell(fp);
> -        fclose(fp);
> -    }
> -
> -    return len;
> +// Returns the length of the file
> +std::ifstream::pos_type filesize(const char* filename)
> +{
> +    std::ifstream in(filename, std::ifstream::ate | std::ifstream::binary);
> +    return in.tellg();
>  }
>
> +
>  // Compares a string to the data in a file.
>  // Returns 0 if complete match
> -int compareData(const char *fn, const char *string, size_t len) {
> +int compareData(const char *filename, const char *string, size_t len)
> +{
>
> -       int rc = 0;
> -       FILE *fp;
> -       char fbyte;
> -       int i=0;
> +       std::ifstream in(filename, std::ifstream::ate | std::ifstream::binary);
> +       std::streamsize size =  in.tellg();
>
> -    if ((fp = fopen(fn, "rb")) != NULL) {
> +       std::vector<char>      buffer(size);
> +
> +       in.read(buffer.data(), size);
> +
> +       if (!std::memcmp(string, buffer.data(), len))
> +               return -1;
>
> -               while(fread(&fbyte, 1,1,fp) == 1) {
> -               if (*(string+i) != fbyte) {
> -                       rc = -2;
> -                       break;
> -               }
> -               i++;
> -       }
> -       fclose(fp);
> -
> -       if (len != i) {
> -               rc = -3;
> -       }
> -
> -    } else {
> -       rc = -1;
> -    }
> -
> -
> -
> -    return rc;
> +
> +    return 0;
>  }
>
>
