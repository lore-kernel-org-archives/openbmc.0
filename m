Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ztHRG6m15zDqk1
 for <openbmc@lists.ozlabs.org>; Sat,  3 Mar 2018 05:10:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2018 10:10:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,413,1515484800"; d="scan'208";a="179422529"
Received: from skyhawk.jf.intel.com (HELO [10.7.150.62]) ([10.7.150.62])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2018 10:10:44 -0800
Subject: Re: openbmc Digest, Vol 30, Issue 51
To: openbmc@lists.ozlabs.org
References: <mailman.137.1518635814.10144.openbmc@lists.ozlabs.org>
 <CAMNAJg3uRy8V9NQJagXkdh=krK4Q5EqW+A4rwYDxZf92XOooTA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <f168b4a9-4ed1-12d1-a3a5-2ea42e8c3f40@linux.intel.com>
Date: Fri, 2 Mar 2018 10:10:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMNAJg3uRy8V9NQJagXkdh=krK4Q5EqW+A4rwYDxZf92XOooTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2018 18:10:51 -0000

Hi Guhan,

I don't believe there is a way to do this today, but I have posted an 
RFC to dynamically collect the SDR info from dbus that you might be 
interested here: https://gerrit.openbmc-project.xyz/#/c/8521/

The ipmi maintainers I believe like this approach and plan on moving 
towards this once this code is integrated into the current ipmi libraries.

Thanks,

James


On 03/01/2018 05:49 PM, guhan balasubramanian wrote:
> Hi,
> 
> Currently in the IPMID (net and host) shared libraries, SDR and sensor 
> ipmi commands are addressed by querying the "IdInfoMap" data structure 
> (sensorhandler.cpp). This data structure is being filled up using 
> phosphor-sensor-inventory/config.yaml, during build time (as mentioned 
> by Patrick and Lei).
> 
> Assuming that we are not able to pre-fill the config yaml, is there a 
> way in the current implementation, where we can add sensors to this 
> sensors "IdInfoMap" data structure dynamically during run time?
> 
> Thanks,
> Guhan
> 
>     Date: Wed, 14 Feb 2018 10:36:23 -0800
>     From: Patrick Venture <venture@google.com <mailto:venture@google.com>>
>     To: Lei YU <mine260309@gmail.com <mailto:mine260309@gmail.com>>
>     Cc: "Sachin Naik (sachnaik)" <sachnaik@cisco.com
>     <mailto:sachnaik@cisco.com>>,
>              "openbmc@lists.ozlabs.org
>     <mailto:openbmc@lists.ozlabs.org>" <openbmc@lists.ozlabs.org
>     <mailto:openbmc@lists.ozlabs.org>>
>     Subject: Re: Porting hwmon sensors to openBMC
>     Message-ID:
>             
>     <CAO=notwMecK=GhvVUtgeVUZFV38K71Q5SSF0TeCS0CxY2W+axw@mail.gmail.com
>     <mailto:GhvVUtgeVUZFV38K71Q5SSF0TeCS0CxY2W%2Baxw@mail.gmail.com>>
>     Content-Type: text/plain; charset="UTF-8"
> 
>     Lei is correct. If you want, however, to read the sensors over IPMI
>     you'll need to add a yaml configuration for the sensors as well for
>     phosphor-host-ipmid.
>     See
>     https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-x86/meta-quanta/meta-q71l/recipes-phosphor/ipmi/q71l-ipmi-sensor-map/config.yaml
>     <https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-x86/meta-quanta/meta-q71l/recipes-phosphor/ipmi/q71l-ipmi-sensor-map/config.yaml>
>     for an example.
> 
>     On Tue, Jan 23, 2018 at 11:04 PM, Lei YU <mine260309@gmail.com
>     <mailto:mine260309@gmail.com>> wrote:
>      > On Tue, Jan 23, 2018 at 3:33 PM, Sachin Naik (sachnaik)
>      > <sachnaik@cisco.com <mailto:sachnaik@cisco.com>> wrote:
>      >> Hi All
>      >>
>      >> I am porting a new board to openbmc.
>      >> I have question on mapping hwmon type sensors to Dbus
>      >>
>      >> So far I have created machine layer and added U-boot config,
>     Kernel config and device tree. In kernel config I have enabled lm75
>     hwmon driver for LM75 temperature device. Corresponding entry added
>     in device tree.
>      >>
>      >> Right now I have created hwmon temperature sensors entry in our
>     machine layer by extending
>     recipes-phosphor/sensors/phosphor-hwmon%.bbappend
>      >> and created conf file with temperature sensors label.
>      >>
>      >> Now my question is how do implement/map dbus temperature sensor
>     value interface to our hwmon temperature sensors? Is above
>     implementation is enough or it requires
>      >> Some mapping for dbus to hwmon instance?
>      >
>      > After you added config files for the temperature sensors with
>      > phosphor-hwmon%.bbappend, phosphor-hwmon will read from
>      > hwmon instance and create dbus objects at
>      > /xyz/openbmc_project/sensors/, which will at least have "Value",
>      > “Scale" and "Unit" properties.
>      >
>      > I do not think it requires other configs, unless I misunderstand
>      > your case?
>      >
>      >>
>      >> Thanks and regards
>      >> Sachin
>      >>
>      >>
> 
