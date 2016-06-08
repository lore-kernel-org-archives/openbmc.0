Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
 [209.85.220.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPVjt5B8DzDq5c
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 11:10:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TM1dsrV3; 
 dkim-atps=neutral
Received: by mail-pa0-f47.google.com with SMTP id bz2so50965754pad.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2016 18:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNxJTT8agGI6wo/853NYwfZTypx583Hzs2vsY/EeHS8=;
 b=TM1dsrV3yX5xXQCHsgoBnu5MWNRXrVi6+NZ7bsTy/rYSYYtEwNBPId0LdKIQ1Q/3eT
 IOPKDrsVx55uEumcBQfsjoQguvWxYk2JCgfT2XS7hTsGAYZNKi4Rx0BPPpGIqELve8eR
 o7tEN0AwUlVFwvfjTdEyZdOjAu6lZUWeFqb6FaC36ss55K/fSCrtiSEOncpivQlp49c8
 HrhHFWJQoymxfV0xXpYoOnVHu79Sn7BtgpxVCfkv4Krv1J6Kv1mFiDbpBArhxr05Iojc
 xyuJ+ZdnroOL+w1XMdPhc8f8yaxpINeTxMmkkYns0tkiLsg6oS5Gt/ZJgWzw33SpQxbM
 ioQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNxJTT8agGI6wo/853NYwfZTypx583Hzs2vsY/EeHS8=;
 b=EZ5VrySQvoYW+B7qfCpVqwWWAPOz3TLfrpl2rjACeoP7hDl+GTCG88SuKK8Is+gQwH
 oSWPUX58WrHXakyYPzbVkNWv3kf/DNMGi7fh8VS+NKlaBBq3yziUa82r1iwOuVIIgw9w
 5Slib1gmECQF71PK9aIOv+wcRbqAWy4zsgIDCQJiVQmgNSB78vRQOG5N0AxhWpMgsy45
 G2QnqhmJVhUTzcMerDoHUdu4G2mSu30oulcIT+BAvgD96M+GZCu8z6BB1muS+u3I2en3
 XZepeo6Wqe9Z7Z+OZVx1cTz5RZARUlnqOiI6le1TSkjlforpGTUPjMpeoBJHxU2hwN0S
 px9Q==
X-Gm-Message-State: ALyK8tL/7kSsozT6zOO0lK1+9TstXCUUmdreLlss4beVJ4U2gbuoOMX7eVLSDCs24EsDhw==
X-Received: by 10.67.5.134 with SMTP id cm6mr2551427pad.93.1465348180684;
 Tue, 07 Jun 2016 18:09:40 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id o64sm37954146pfb.76.2016.06.07.18.09.38
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 07 Jun 2016 18:09:40 -0700 (PDT)
Date: Wed, 8 Jun 2016 11:09:29 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: "Ratan K Gupta" <ratagupt@in.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Implement Network Override
Message-ID: <20160608110929.4b2e4715@camb691>
In-Reply-To: <OF95926C77.EC120831-ON00257FCB.002E3C4C-00257FCB.00389AF0@notes.na.collabserv.com>
References: <20160607112957.7fc13fe0@camb691>
 <OF95926C77.EC120831-ON00257FCB.002E3C4C-00257FCB.00389AF0@notes.na.collabserv.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 01:10:43 -0000

On Tue, 7 Jun 2016 10:18:16 +0000
"Ratan K Gupta" <ratagupt@in.ibm.com> wrote:

> Hi Cyrl,
>  
> Thanks for reviewing the code.
>  
> I spoke to the maintainer of the host-ipmid module and was told that we can use C++/C interchangeably based on the use cases.
>  

Sure, and if using c++ really buys you something I suppose I could understand
but I genuinely don't see what making a c/c++ mess has bought you. I'm fairly
sure the same patch can be 100% C (like the rest of the file) and not be
significantly different in any way, perhaps just a few more calls to C string.h
functions.

> I also noticed that we are using the g++ compiler in the makefile of host-ipmid module so thought we an use c++.
>  
> Please find my comments inline.
>  
>  
> Regards
> Ratan
>  
> ----- Original message -----
> From: Cyril Bur <cyrilbur@gmail.com>
> To: Ratan K Gupta/India/IBM@IBMIN
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: [PATCH phosphor-host-ipmid] Implement Network Override
> Date: Tue, Jun 7, 2016 7:00 AM
>  
> On Mon,  6 Jun 2016 13:00:44 -0500
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
> 
> > From: ratagupt <ratagupt@in.ibm.com>
> >
> 
> Please see: https://lists.ozlabs.org/pipermail/openbmc/2016-May/003240.html I'm
> not going to bother explaining (some) things, if I'm not clear it's because you
> didn't read that email and associated links
> 
> > ---
> >  chassishandler.C | 228 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 220 insertions(+), 8 deletions(-)
> >
> > diff --git a/chassishandler.C b/chassishandler.C
> > index d5b3404..e21d6da 100644
> > --- a/chassishandler.C
> > +++ b/chassishandler.C
> > @@ -3,15 +3,19 @@
> >  #include <stdio.h>
> >  #include <string.h>
> >  #include <stdint.h>
> > -
> > -
> > +#include <arpa/inet.h>
> > +#include <netinet/in.h>
> > +#include <string>
> > +using namespace std;
> >  //Defines
> >  #define SET_PARM_VERSION 1
> >  #define SET_PARM_BOOT_FLAGS_PERMANENT 0x40 //boot flags data1 7th bit on
> >  #define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80 //boot flags data1 8th bit on
> >  #define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7 & 8 bit on
> > -
> > -
> > +#define SIZE_MAC 18
> > +#define SIZE_HOST_NETWORK_DATA 26
> > +#define SIZE_BOOT_OPTION SIZE_HOST_NETWORK_DATA
> > +//#define INET_ADDRSTRLEN 15
> >  
> >  // OpenBMC Chassis Manager dbus framework
> >  const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
> > @@ -233,14 +237,197 @@ struct get_sys_boot_options_t {
> >  struct get_sys_boot_options_response_t {
> >      uint8_t version;
> >      uint8_t parm;
> > -    uint8_t data[5];
> > +    uint8_t data[SIZE_BOOT_OPTION];
> >  }  __attribute__ ((packed));
> 
> This is a packed struct, so, this means it could represent a structure in
> memory or a file, I can't see how big SIZE_BOOT_OPTION is but is it 5? Later
> you use it for a data field that had size 8, so if you ever want to memcpy for
> sizeof(struct get_sys_boot_options_response_t) or sizeof(struct
> set_sys_boot_options_t) will this work?
> 
> Picture this scenario; process A (which you have no control over) writes a
> struct get_sys_boot_options_response_t to a file and it had data[5], process
> B (you) now try to read that file and cast your buffer to a struct
> get_sys_boot_options_response_t but you used data[SIZE_BOOT_OPTION] and you
> walk through 'for (i = 0; i < SIZE_BOOT_OPTION; i++)' completely correct from
> your point of view, your structure should be big enough, but what was written
> to file wasn't big enough for you to do that... what happens? Now imagine the
> file was mmaped... what happens?
>  
> RG>>Here Before my fix the SetSystem boot option response data was 8 byte long and the getSystemBootOption Data was 5 Byte long.It is all about the IPMI protocol how much byte needs to be send or is it to be received. 
>    RG>>Now with the fix I have modified both(getSystemBootOption/SetSystem boot option Data)  to 26 bytes long.Now if the other process sends me the 20byte/5byte.Our code is taking care.if the other process sends more then 26 byte,we are ignoring that data as it is not as per the protocol.

So the struct doesn't represent the ipmi protocol exactly anymore. It is no
longer an 'on the wire', 'in the file' or 'in memory' representation of exactly
the what the ipmi protocol states. Does any of the existing code assume it
does? Either way, it probably shouldn't be packed now.

>  
>  
>  
>  
> 
> >  
> >  struct set_sys_boot_options_t {
> >      uint8_t parameter;
> > -    uint8_t data[8];
> > +    uint8_t data[SIZE_BOOT_OPTION];
> >  }  __attribute__ ((packed));
> >  
> > +struct host_network_config_t {
> > +     string ipaddress;
> > +     string prefix;
> > +     string gateway;
> > +     string macaddress;
> > +     string isDHCP;
> > +
> > +     host_network_config_t()
> > +     {
> > +         ipaddress = "";
> > +         prefix = "";
> > +         gateway = "";
> > +         macaddress = "";
> > +         isDHCP = "";
> > +     }
> 
> Admittedly I don't do c++, is this c++? Do c++ programmers recommend this?
>  
> RG>>>>>In C++ it is valid contruct.
> 

But do c++ recommend this? I ask because there is a huge subset of c++ that
everyone agrees is a bad idea.

> > +};
> > +
> > +uint8_t getHostNetworkData(get_sys_boot_options_response_t* respptr)
> 
> Style
> 
> > +{
> > +
> > +
> > +    printf ("Inside getHostNetworkData");
> 
> Style, also that looks a lot like a debug printf...?
> 
> > +    char * prop = NULL;
> 
> Style
> 
> > +
> > +    uint8_t data[SIZE_BOOT_OPTION]={0x80,0x21, 0x70 ,0x62 ,0x21,0x00 ,0x01 ,0x06 ,0x04};
> 
> uint8_t data[SIZE_BOOT_OPTION] = {0x80, 0x21, 0x70, 0x62, 0x21, 0x00, 0x01,
> 0x06, 0x04};
> 
> > +
> > +    //As first 9 bytes are prefilled so in rest of the bytes we are assigning 0
> > +
> > +    memset( data+9 ,0,(SIZE_BOOT_OPTION-9) );
> 
> "All array elements that are not initialized explicitly are initialized
> implicitly the same way as objects that have static storage duration."
> 
> http://en.cppreference.com/w/c/language/array_initialization 
> 
> so what you've done is pointless...
>  
> RG>>Accepted
> 
> > +
> > +    int rc = dbus_get_property("network_config",&prop);
> 
> int rc = dbus_get_property("network_config", &prop);
> 
> > +
> > +    if (rc < 0) {
> > +        fprintf(stderr, "Dbus get property(boot_flags) failed for get_sys_boot_options.\n");
> > +        return rc;
> > +    }
> > +
> > +    /* network_config property Value would be in the form of
> > +     * ipaddress=1.1.1.1,prefix=16,gateway=2.2.2.2,mac=11:22:33:44:55:66,dhcp=0
> > +     */
> > +
> > +    /* Parsing the string and fill the hostconfig structure with the
> > +     * values */
> > +
> > +    host_network_config_t host_config;
> > +    string delimiter = ",";
> > +
> > +    int pos = 0;
> > +    string token,name,value;
> > +    string conf_str(prop);
> > +    
> > +    printf ("Configuration String[%s]\n ",conf_str.c_str());
> > +
> > +    while ((pos = conf_str.find(delimiter)) != std::string::npos) {
> > +
> > +        token = conf_str.substr(0, pos);
> > +        int pos1 = token.find("=");
> > +
> > +        name = token.substr(0,pos1);
> > +        value = token.substr(pos1+1,pos);
> > +
> > +        if ( name == "ipaddress" )
> 
> There needs to be some kind of consistency as to what language we're writing in
> because that line can't persist. I understand that in c++ this will do what you
> want, however, to a C programmer screams alarm bells, this compares pointers
> which is almost never what you want to do.
> 
> In fairness this problem started long before this patch but that's no reason to
> continue it. I'm flexible, I like to think I'm actually not that strongly
> opinionated (at least on this issue), please pick one!
> 
> Looking at the language breakdown that github seems to think this project is
> written in:
> C 97.2% Makefile 1.6% Other 1.2%
> 
> How about we go exclusively with C?
>  
> RG>>>This needs to be discussed with the stakeholders.
> 
> Maintainers: Can we try to enforce this at a Makefile level?
> 
> > +            host_config.ipaddress = value;
> > +        else if ( name == "prefix")
> > +            host_config.prefix = value;
> > +        else if ( name == "gateway" )
> > +            host_config.gateway = value;
> > +        else if ( name == "mac" )
> > +            host_config.macaddress = value;
> > +        else if ( name == "dhcp" )
> > +            host_config.isDHCP = value;
> > +
> > +        conf_str.erase(0, pos + delimiter.length());
> > +        printf ("Name=[%s],Value=[%s],position=[%d]\n",name.c_str(),value.c_str(),pos);
> > +    }
> > +
> > +    //Converting the mac address as number//
> > +    //If there as an error in converting the mac as number we are not throwing
> > +    //error we would be sending 0's for the mac.
> > +    
> > +    char *tokptr = NULL;
> > +    char* digit = strtok_r((char *)host_config.macaddress.c_str(), ":", &tokptr);
> > +    if (digit == NULL)
> > +    {
> > +        fprintf(stderr, "Unexpected MAC format: %s", host_config.macaddress.c_str());
> > +    }
> > +    
> > +    //As 9 bytes are pre filled so staring from index 9.If there is a failure
> > +    //in the strtok_r then digit will be null then we don't need to do
> > +    //anything as data is prefilled with 0
> > +    
> > +    uint8_t index=9;
> > +
> > +    while (digit != NULL)
> > +    {
> > +        int resp_byte = strtoul(digit, NULL, 16);
> > +        memcpy((void*)&data[index], &resp_byte, 1);
> > +        index++;
> > +        digit = strtok_r(NULL, ":", &tokptr);
> > +    }
> > +
> > +    //Conevrt the dhcp,ipaddress,mask and gateway as hex number
> > +    data[index++]=0x00;
> > +    sscanf(host_config.isDHCP.c_str(),"%02X",&data[index++]);
> > +
> > +    inet_pton(AF_INET,host_config.ipaddress.c_str(),(void *)&data[index]);
> > +    index+=4;
> > +    sscanf(host_config.prefix.c_str(),"%02X",&data[index++]);
> > +    inet_pton(AF_INET,host_config.gateway.c_str(),(void *)&data[index]);
> > +    index+=4;
> > +
> > +    printf ("\n===========Printing the Network Conf=====================\n");
> > +
> > +    for (int j = 0;j<index;j++)
> > +        printf("%02x ", data[j]);
> > +
> > +    memcpy(respptr->data,data,SIZE_BOOT_OPTION);
> > +    return 0;
> > +
> > +}
> > +
> > +uint8_t setHostNetworkData(set_sys_boot_options_t * reqptr)
> > +{
> > +    printf ("\n Inside setHostNetworkData***********");
> > +    string host_network_config;
> > +    char mac[SIZE_MAC];
> > +    char ipAddress[INET_ADDRSTRLEN];
> > +    char gateway[INET_ADDRSTRLEN];
> > +    char prefix[1];
> > +    char dhcp[2];
> > +    uint32_t cookie = 0;
> > +
> > +
> > +    memset( mac ,0,SIZE_MAC );
> > +    memset(ipAddress,0,INET_ADDRSTRLEN);
> > +    memset(gateway,0,INET_ADDRSTRLEN);
> > +    memset(prefix,0,1);
> > +    memset(dhcp,0,2);
> > +
> > +    uint8_t index = 9;  
> > +    sscanf((char *)&(reqptr->data[1]),"%02X",&cookie);
> > +
> > +    if ( !cookie) {
> > +    
> > +         snprintf(mac, SIZE_MAC, "%02x:%02x:%02x:%02x:%02x:%02x",
> > +            reqptr->data[index],
> > +            reqptr->data[index+1],
> > +            reqptr->data[index+2],
> > +            reqptr->data[index+3],
> > +            reqptr->data[index+4],
> > +            reqptr->data[index+5]);
> > +
> > +
> > +        snprintf(dhcp,2, "%d", reqptr->data[index+6]);
> > +
> > +        snprintf(ipAddress, INET_ADDRSTRLEN, "%d.%d.%d.%d",
> > +            reqptr->data[index+8], reqptr->data[index+9], reqptr->data[index+10], reqptr->data[index+11]);
> > +
> > +        snprintf(prefix, INET_ADDRSTRLEN, "%d", reqptr->data[index+12]);
> > +
> > +
> > +        snprintf(gateway, INET_ADDRSTRLEN, "%d.%d.%d.%d",
> > +            reqptr->data[index+13], reqptr->data[index+14], reqptr->data[index+15], reqptr->data[index+16]);
> > +    }
> > +
> > +    host_network_config += "ipaddress="+string(ipAddress)+",prefix="+ \
> > +                       string(prefix)+",gateway="+string(gateway)+\
> > +                       ",mac="+string(mac)+",dhcp="+string(dhcp);
> > +
> > +
> > +    printf ("Host Config Str= %s\n",host_network_config.c_str());
> > +
> > +    int r = dbus_set_property("network_config",host_network_config.c_str());
> > +
> > +    if (r < 0) {
> > +        fprintf(stderr, "Dbus set property(network_config) failed for set_sys_boot_options.\n");
> > +        r = IPMI_CC_UNSPECIFIED_ERROR;
> > +    }
> > +
> > +    return r;
> > +
> > +}
> > +
> >  ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >                                ipmi_request_t request, ipmi_response_t response,
> >                                ipmi_data_len_t data_len, ipmi_context_t context)
> > @@ -446,7 +633,18 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >          }
> >  
> >  
> > -    } else {
> > +    } else if ( reqptr->parameter == 0x61 ) {
> > +       resp->parm      = 0x61;
> > +       int ret = getHostNetworkData(resp);
> > +       if (ret < 0) {
> > +           fprintf(stderr, "getHostNetworkData failed for get_sys_boot_options.\n");
> > +           rc = IPMI_CC_UNSPECIFIED_ERROR;
> > +
> > +       }else
> > +          rc = IPMI_CC_OK;
> > +    }
> > +
> > +    else {
> >          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> >      }
> >  
> > @@ -476,6 +674,9 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >       * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
> >       * This is the only parameter used by petitboot.
> >       */
> > +
> > +
> > +    printf("IPMI SET_SYS_BOOT_OPTIONS reqptr->parameter =[%d]\n",reqptr->parameter);
> >      if (reqptr->parameter == 5) {
> >  
> >          s = get_boot_option_by_ipmi(((reqptr->data[1] & 0x3C) >> 2));
> > @@ -507,7 +708,18 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> >              rc = IPMI_CC_UNSPECIFIED_ERROR;
> >          }
> >  
> > -    } else {
> > +    }
> > +    else if ( reqptr->parameter == 0x61 ) {
> > +       printf("IPMI SET_SYS_BOOT_OPTIONS reqptr->parameter =[%d]\n",reqptr->parameter);
> > +       int ret = setHostNetworkData(reqptr);
> > +       if (ret < 0) {
> > +           fprintf(stderr, "setHostNetworkData failed for set_sys_boot_options.\n");
> > +           rc = IPMI_CC_UNSPECIFIED_ERROR;
> > +
> > +       }
> > +    }      
> > +    
> > +    else {
> >          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> >          rc = IPMI_CC_PARM_NOT_SUPPORTED;
> >      }
>  
> 
> 
