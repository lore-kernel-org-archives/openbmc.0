Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D43CC1A001D
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 17:12:54 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 21 Jan 2016 01:12:52 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Jan 2016 01:12:50 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id E8A1A38C8039
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 01:12:49 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0L6Cn6k31457346
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 06:12:49 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0L6CnsJ026531
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 01:12:49 -0500
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.228] (may be
 forged))
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0L6CbUZ025855; Thu, 21 Jan 2016 01:12:48 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 31334229EA9A; Thu, 21 Jan 2016 17:12:35 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Vishwanatha Subbanna <vishwanath@in.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v4] Set Fault and Present status while
 handling fru
In-Reply-To: <201601200649.u0K6noha17498472@d28relay01.in.ibm.com>
References: <1452582011-6265-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452582011-6265-2-git-send-email-openbmc-patches@stwcx.xyz>
 <871t9lchae.fsf@linux.vnet.ibm.com>
 <201601200649.u0K6noha17498472@d28relay01.in.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 21 Jan 2016 17:12:35 +1100
Message-ID: <87r3hb5ulo.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012106-0057-0000-0000-000003346AE8
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
X-List-Received-Date: Thu, 21 Jan 2016 06:12:55 -0000

Vishwanatha Subbanna <vishwanath@in.ibm.com> writes:

> hello Stewart,
>
> Thank you for reviewing. Please find my comments.

Please use internet style reply, I cannot easily differentiate what are
your comments, it's all text of the same colour.

Note that using Lotus Notes for open source development email is pretty
much impossible, and with IBM Verse it's actually impossible, you'll
need to get an LTC IMAP account or a GMail account.

> From:	Stewart Smith <stewart@linux.vnet.ibm.com>
> To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>,
>             openbmc@lists.ozlabs.org
> Date:	14/01/2016 03:06 am
> Subject:	Re: [PATCH ipmi-fru-parser v4] Set Fault and Present status
>             while handling fru
> Sent by:	"openbmc" <openbmc-bounces
>             +vishwanath=in.ibm.com@lists.ozlabs.org>
>
>
>
> OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>> diff --git a/fru-area.H b/fru-area.H
>> new file mode 100644
>> index 0000000..90dd92b
>> --- /dev/null
>> +++ b/fru-area.H
>> @@ -0,0 +1,153 @@
>> +#ifndef __IPMI_FRU_AREA_H__
>> +#define __IPMI_FRU_AREA_H__
>> +
>> +#include <stdint.h>
>> +#include <stddef.h>
>> +#include <systemd/sd-bus.h>
>> +#include <string>
>> +#include <vector>
>> +#include <memory>
>> +#include "writefrudata.H"
>> +
>> +class ipmi_fru;
>> +typedef std::vector<std::unique_ptr<ipmi_fru>> fru_area_vec_t;
>> +
>> +class ipmi_fru
>> +{
>> +    private:
>> +        // FRU ID
>
> Comment is not needed, it should be obvious from member name.
>
>> +        uint8_t iv_fruid;
>
> What does iv_ prefix mean?
>
> iv_ is widely used C++ notation for class Instance Variable.

huh... most C++ coding styles for projects I've worked on have been a m_
prefix or simply a _ prefix to indicate member variables. Is there an
OpenBMC coding style for this?

>> +
>> +        // Type of the fru matching offsets in common header
>> +        uint8_t iv_type;
>
> if it's a type of a limited set, should this be an enum?
>
> Sorry, not sure I got this question. Type is actually an enum in frup.h in
> ipmi-fru-parser repo.

Then the member variable should be of enum type, this way the C++
compiler will catch any attempts to assign other values to it.

>
>> +        // If a particular area has been marked valid / invalid
>> +        inline bool get_valid() const
>> +        {
>> +            return iv_valid;
>> +        }
>
> why not is_valid() ?
>
> Yeah.. sounds better name.
>
>> --- a/readeeprom.C
>> +++ b/readeeprom.C
>> @@ -12,7 +12,7 @@ static void exit_with_error(const char* err, char**
> argv)
>>  }
>>
>>  //--------------------------------------------------------------------------
>
>> -// This gets called by udev monitor soon after seeing hog plugs for
> EEPROMS.
>> +// This gets called by udev monitor soon after seeing hog plugs for
> EEPROMS.
>>  //--------------------------------------------------------------------------
>
>
> Best to do whitespace fixups in separate patch.
>
> I understand. But do you feel I can go ahead this time and practise this
> from next submissions ?. -or- do you see a need to do here ?

While I'm not the final arbiter of what gets merged, I'd like to see it here.


>> +//----------------------------------------------------------------
>> +// Constructor
>> +//----------------------------------------------------------------
>> +ipmi_fru::ipmi_fru(const uint8_t fruid, const uint8_t type,
>> +                   sd_bus *bus_type, bool bmc_fru)
>
> The comment is redundant.
>
> Okay.. It was more of a practise that I have followed to have atleast one
> liner on what a particular function is.
> Are you seeing it does not make sense ?. I saw couple examples in hostboot
> ipmi code with such comments so thought its fine to use.

My personal hatred for such comments is probably larger than the average
persons' thoughts on them :)

>
>> +//-----------------------------------------------------
>> +// Accepts a pointer to data and sets it in the object.
>> +//-----------------------------------------------------
>> +void ipmi_fru::set_data(const uint8_t *data, const size_t len)
>> +{
>> +    iv_len = len;
>> +    iv_data = new uint8_t[len];
>> +    memcpy(iv_data, data, len);
>> +}
>
> Comment would do better detailing ownership of data rather than simply
> explaining what the code obviously does.
>
> Agreed.
>
>> +//-----------------------------------------------------
>> +// Sets the dbus parameters
>> +//-----------------------------------------------------
>> +void ipmi_fru::update_dbus_paths(const char *bus_name,
>> +                      const char *obj_path, const char *intf_name)
>> +{
>> +    iv_bus_name = bus_name;
>> +    iv_obj_path = obj_path;
>> +    iv_intf_name = intf_name;
>> +}
>
> why are we passing in C strings when everything else is std::string?
> It's just as easy to create std::string on the way in as it is to do so
> here, and if the caller is dealing with std::string, then we have more
> hoops
>
> Norm's skeleton code which I am calling to get those parameters are
> returning them as char *s

But why not make the API here the good one, and then go and fix the
other code?


>>  //------------------------------------------------
>>  // Takes the pointer to stream of bytes and length
>>  // returns the 8 bit checksum per IPMI spec.
>>  //-------------------------------------------------
>> -unsigned char calculate_crc(unsigned char *data, int len)
>> +unsigned char calculate_crc(const unsigned char *data, size_t len)
>>  {
>>      char crc = 0;
>> -    int byte = 0;
>> +    size_t byte = 0;
>>
>>      for(byte = 0; byte < len; byte++)
>>      {
>
> This should likely be a separate patch, this change seems unrelated to
> the other changes.
>
> You mean, submit a patch for changing the name ?

the function signature, yes.

> What is the checksum anyway? Is it CRC32? A byte at a time loop is
> unlikely to be the most optimal way of doing things.
>
> Its a standard IPMI V2.0 checksum algo.
>
> http://www.intel.in/content/dam/www/public/us/en/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
>
>
> Page #: 163 / 208

That would be a good thing to add to the comment in the code, as it
provides further information on *why* this code is the way it is.

-- 
Stewart Smith
OPAL Architect, IBM.
