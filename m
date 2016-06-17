Return-Path: <sam.mj@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW8Qp1rLczDqpJ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 15:47:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5H5iBnK003550
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 01:47:12 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23kw2qbvup-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 01:47:11 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Fri, 17 Jun 2016 15:47:09 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 17 Jun 2016 15:47:08 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id AD6233578052
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 15:47:07 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5H5l7po18612232
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 15:47:07 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5H5l7OI008855
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 15:47:07 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u5H5l7Nj008836; Fri, 17 Jun 2016 15:47:07 +1000
Received: from localhost (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4C70CA0133;
 Fri, 17 Jun 2016 15:47:06 +1000 (AEST)
Date: Fri, 17 Jun 2016 15:47:06 +1000
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, ratagupt <ratagupt@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v5] Resolves openbmc/openbmc#267'
References: <20160616145040.18289-1-openbmc-patches@stwcx.xyz>
 <20160616145040.18289-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160616145040.18289-2-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16061705-0012-0000-0000-000001A055B9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16061705-0013-0000-0000-0000056B07C4
Message-Id: <20160617054706.GA5752@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-17_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606170072
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
X-List-Received-Date: Fri, 17 Jun 2016 05:47:14 -0000

Hi Ratan,

I have some notes below, but mainly I have these two questions:

- What is the purpose of the host_network_config struct, and why is the
  request parsed into a string before being stored? Why not just store
  the original request as is?
- Do you have tests to verify the correctness of the hex produced?

Cheers,
Sam

On Thu, Jun 16, 2016 at 09:50:40AM -0500, OpenBMC Patches wrote:
> From: ratagupt <ratagupt@in.ibm.com>
> 
> ---
>  chassishandler.C | 212 +++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 200 insertions(+), 12 deletions(-)
> 
> diff --git a/chassishandler.C b/chassishandler.C
> index d5b3404..2cc0895 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -1,17 +1,25 @@
>  #include "chassishandler.h"
>  #include "ipmid-api.h"
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <string.h>
>  #include <stdint.h>
> -
> -
> +#include <arpa/inet.h>
> +#include <netinet/in.h>
> +#include <string>
> +#include <sstream>
> +#include <array>
> +using namespace std;
>  //Defines
> -#define SET_PARM_VERSION 1
> -#define SET_PARM_BOOT_FLAGS_PERMANENT 0x40 //boot flags data1 7th bit on
> +#define SET_PARM_VERSION                     0x01
> +#define SET_PARM_BOOT_FLAGS_PERMANENT        0x40 //boot flags data1 7th bit on
>  #define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80 //boot flags data1 8th bit on
>  #define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7 & 8 bit on 
>  
> -
> +#define SIZE_MAC                             18
> +#define SIZE_HOST_NETWORK_DATA               26

How did you decide on the size for SIZE_HOST_NETWORK_DATA?

> +#define SIZE_BOOT_OPTION                     SIZE_HOST_NETWORK_DATA
> +#define SIZE_PREFIX                          7
>  
>  // OpenBMC Chassis Manager dbus framework
>  const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
> @@ -233,14 +241,174 @@ struct get_sys_boot_options_t {
>  struct get_sys_boot_options_response_t {
>      uint8_t version;
>      uint8_t parm;
> -    uint8_t data[5];
> +    uint8_t data[SIZE_BOOT_OPTION];
>  }  __attribute__ ((packed));
>  
>  struct set_sys_boot_options_t {
>      uint8_t parameter;
> -    uint8_t data[8];
> +    uint8_t data[SIZE_BOOT_OPTION];
>  }  __attribute__ ((packed));
>  
> +struct host_network_config_t {
> +     string ipaddress;
> +     string prefix;
> +     string gateway;
> +     string macaddress;
> +     string isDHCP;

Is there a need to have these all as strings?

> +
> +     host_network_config_t():ipaddress(),prefix(),gateway(),macaddress() {}
> +};
> +
> +uint8_t getHostNetworkData(get_sys_boot_options_response_t *respptr)
> +{
> +    char *prop = NULL;
> +
> +    std::array<uint8_t, SIZE_BOOT_OPTION> respData{0x80,0x21, 0x70 ,0x62 ,0x21,0x00 ,0x01 ,0x06 ,0x04};

The "0x21, 0x70 ,0x62 ,0x21" cookie is a magic value that Petitboot uses
to recognise an override message it can read. Using it unconditionally
here means that openbmc would be hard-coded to only support Petitboot,
is that what we, or other users would expect?

> +
> +    int rc = dbus_get_property("network_config",&prop);
> +
> +    if (rc < 0) {
> +        fprintf(stderr, "Dbus get property(boot_flags) failed for get_sys_boot_options.\n");
> +        return rc;
> +    }
> +
> +    /* network_config property Value would be in the form of 
> +     * ipaddress=1.1.1.1,prefix=16,gateway=2.2.2.2,mac=11:22:33:44:55:66,dhcp=0
> +     */
> +
> +    /* Parsing the string and fill the hostconfig structure with the 
> +     * values */

If I'm reading this right the host_config structure is filled in
according to the "network_config" string, and then each field is copied
into respData - would it be simpler to skip the structure and just
fill in respData?

> +
> +    host_network_config_t host_config;
> +    string delimiter = ",";
> +
> +    size_t pos = 0;
> +    string token,name,value;
> +    string conf_str(prop);
> +    
> +    printf ("Configuration String[%s]\n ",conf_str.c_str());

Should we print this all the time, or just on debug?

> +
> +    while ( conf_str.length() > 0) {
> +
> +        pos = conf_str.find(delimiter);
> +
> +        //This condition is to extract the last 
> +        //Substring as we will not be having the delimeter 
> +        //at end. std::string::npos is -1
> +        
> +        if ( pos == std::string::npos )
> +        { 
> +           pos = conf_str.length();
> +        }
> +        token = conf_str.substr(0, pos);
> +        int pos1 = token.find("=");
> +
> +        name = token.substr(0,pos1);
> +        value = token.substr(pos1+1,pos);
> +
> +        if ( name == "ipaddress" )
> +            host_config.ipaddress = value;
> +        else if ( name == "prefix")
> +            host_config.prefix = value; 
> +        else if ( name == "gateway" )
> +            host_config.gateway = value;
> +        else if ( name == "mac" )
> +            host_config.macaddress = value;
> +        else if ( name == "dhcp" )
> +            host_config.isDHCP = value;
> +        
> +        conf_str.erase(0, pos + delimiter.length());
> +    }
> +
> +    //Starting from index 9 as 9 bytes are prefilled.
> +
> +    pos = 0; 
> +    delimiter = ":";
> +    uint8_t resp_byte = 0;
> +    uint8_t index = 9;
> +    
> +    while ((pos = host_config.macaddress.find(delimiter)) != std::string::npos) {
> +
> +        token = host_config.macaddress.substr(0, pos);
> +        resp_byte = strtoul(token.c_str(), NULL, 16);

Would be a good idea to check strtoul for errors

> +        memcpy((void*)&respData[index], &resp_byte, 1);

Don't need to cast to (void*)

> +        host_config.macaddress.erase(0, pos + delimiter.length());
> +        index++;
> +    }
> +
> +    resp_byte = strtoul(host_config.macaddress.c_str(), NULL, 16);
> +    memcpy((void*)&respData[index++], &resp_byte, 1);

Same

> +
> +    //Conevrt the dhcp,ipaddress,mask and gateway as hex number

Typo, Conevrt/Convert

> +    respData[index++]=0x00;
> +    sscanf(host_config.isDHCP.c_str(),"%02X",&respData[index++]);
> +
> +    inet_pton(AF_INET,host_config.ipaddress.c_str(),(void *)&respData[index]);
> +    index+=4;
> +
> +    sscanf(host_config.prefix.c_str(),"%02d",&respData[index++]);
> +    inet_pton(AF_INET,host_config.gateway.c_str(),(void *)&respData[index]);
> +    index+=4; 
> +    
> +    printf ("\n===Printing the IPMI Formatted Data========\n");

As above, debug message?

> +
> +    for (int j = 0;j<index;j++)

Spacing it out like this is easier to read:

    for (int j = 0; j < index; j++)

> +        printf("%02x ", respData[j]);
> +
> +    memcpy(respptr->data,respData.data(),SIZE_BOOT_OPTION);
> +    return 0;
> +}
> +
> +uint8_t setHostNetworkData(set_sys_boot_options_t * reqptr)
> +{
> +    string host_network_config;
> +    char mac[SIZE_MAC] = {0};
> +    char ipAddress[INET_ADDRSTRLEN] = {0};
> +    char gateway[INET_ADDRSTRLEN] = {0};
> +    char dhcp[SIZE_PREFIX] = {0};
> +    char prefix[SIZE_PREFIX] = {0};
> +    uint32_t cookie = 0;
> +
> +    memcpy(&cookie,(char *)&(reqptr->data[1]),sizeof(cookie));
> +    
> +    uint8_t index = 9;  
> +
> +    if ( cookie) {
> +     
> +            snprintf(mac, SIZE_MAC, "%02x:%02x:%02x:%02x:%02x:%02x",
> +            reqptr->data[index],
> +            reqptr->data[index+1],
> +            reqptr->data[index+2],
> +            reqptr->data[index+3],
> +            reqptr->data[index+4],
> +            reqptr->data[index+5]);
> +    
> +        snprintf(dhcp,SIZE_PREFIX, "%d", reqptr->data[index+7]);

*If* this is following the format used by Petitboot, is the order of
fields here correct? It looks like the size fields have been skipped.

> +
> +        snprintf(ipAddress, INET_ADDRSTRLEN, "%d.%d.%d.%d",
> +            reqptr->data[index+8], reqptr->data[index+9], reqptr->data[index+10], reqptr->data[index+11]);
> +
> +        snprintf(prefix,SIZE_PREFIX,"%d", reqptr->data[index+12]);

What is the prefix? Is it meant to be the subnet mask?

> +
> +        snprintf(gateway, INET_ADDRSTRLEN, "%d.%d.%d.%d",
> +            reqptr->data[index+13], reqptr->data[index+14], reqptr->data[index+15], reqptr->data[index+16]);
> +    }
> +
> +    host_network_config += "ipaddress="+string(ipAddress)+",prefix="+ \
> +                       string(prefix)+",gateway="+string(gateway)+\
> +                       ",mac="+string(mac)+",dhcp="+string(dhcp);
> +
> +    printf ("Network configuration changed: %s\n",host_network_config.c_str());
> +
> +    int r = dbus_set_property("network_config",host_network_config.c_str());
> +
> +    if (r < 0) {
> +        fprintf(stderr, "Dbus set property(network_config) failed for set_sys_boot_options.\n");
> +        r = IPMI_CC_UNSPECIFIED_ERROR;
> +    }
> +    return r;
> +}
> +
>  ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
>                                ipmi_request_t request, ipmi_response_t response, 
>                                ipmi_data_len_t data_len, ipmi_context_t context)
> @@ -446,7 +614,18 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>          }
>  
>  
> -    } else {
> +    } else if ( reqptr->parameter == 0x61 ) {
> +       resp->parm      = 0x61;
> +       int ret = getHostNetworkData(resp);
> +       if (ret < 0) {
> +           fprintf(stderr, "getHostNetworkData failed for get_sys_boot_options.\n");
> +           rc = IPMI_CC_UNSPECIFIED_ERROR;
> +
> +       }else
> +          rc = IPMI_CC_OK;
> +    }
> +
> +    else {
>          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
>      }
>  
> @@ -464,11 +643,10 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  {
>      ipmi_ret_t rc = IPMI_CC_OK;
>      char *s;
> -
> -    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
> -
>      set_sys_boot_options_t *reqptr = (set_sys_boot_options_t *) request;
>  
> +    printf("IPMI SET_SYS_BOOT_OPTIONS reqptr->parameter =[%d]\n",reqptr->parameter);
> +
>      // This IPMI command does not have any resposne data
>      *data_len = 0;
>  
> @@ -476,6 +654,7 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>       * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
>       * This is the only parameter used by petitboot.
>       */
> +

Extra line

>      if (reqptr->parameter == 5) {
>  
>          s = get_boot_option_by_ipmi(((reqptr->data[1] & 0x3C) >> 2));
> @@ -507,7 +686,16 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>              rc = IPMI_CC_UNSPECIFIED_ERROR;
>          }
>  
> -    } else {
> +    }
> +    else if ( reqptr->parameter == 0x61 ) {
> +       printf("IPMI SET_SYS_BOOT_OPTIONS reqptr->parameter =[%d]\n",reqptr->parameter);
> +       int ret = setHostNetworkData(reqptr);
> +       if (ret < 0) {
> +           fprintf(stderr, "setHostNetworkData failed for set_sys_boot_options.\n");
> +           rc = IPMI_CC_UNSPECIFIED_ERROR;
> +       }
> +    }      
> +    else {
>          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
>          rc = IPMI_CC_PARM_NOT_SUPPORTED;
>      }
> -- 
> 2.8.4
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
