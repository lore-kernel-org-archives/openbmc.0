Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43rnLr4wcfzDqht
 for <openbmc@lists.ozlabs.org>; Sat,  2 Feb 2019 06:32:51 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x11JNtmS131625
 for <openbmc@lists.ozlabs.org>; Fri, 1 Feb 2019 14:32:49 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qcv7vrdm2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Feb 2019 14:32:48 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Fri, 1 Feb 2019 19:32:48 -0000
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 1 Feb 2019 19:32:46 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x11JWjBY22151206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Feb 2019 19:32:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B598AC060;
 Fri,  1 Feb 2019 19:32:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03AD0AC05B;
 Fri,  1 Feb 2019 19:32:44 +0000 (GMT)
Received: from [9.10.99.133] (unknown [9.10.99.133])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  1 Feb 2019 19:32:44 +0000 (GMT)
Subject: Re: [EXT] Re: OpenBMC Sensors
To: Vijay Khemka <vijaykhemka@fb.com>, Aaron Williams <awilliams@marvell.com>,
 Patrick Venture <venture@google.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <6065976.siBLTEBlHZ@flash>
 <CAJoAoZnV+u8kJKV7TkPxU_b1hdmJ3nbFyD6rVMSd9ohPSjDHig@mail.gmail.com>
 <CAO=notzSOb7VcYhByoyae63o3xFctpJpMCnKgaTn0dRKp+VckA@mail.gmail.com>
 <15407680.LHmlcfl6Tm@flash> <9D2AC2D4-287E-4449-B817-0A6295E55E78@fb.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Fri, 1 Feb 2019 13:32:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <9D2AC2D4-287E-4449-B817-0A6295E55E78@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19020119-0040-0000-0000-000004BB0C01
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010517; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000277; SDB=6.01154943; UDB=6.00593882; IPR=6.00935384; 
 MB=3.00025393; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-01 19:32:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020119-0041-0000-0000-000008C6230A
Message-Id: <c42bf9a7-3b37-47d9-3764-d06bcd20fd4b@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-01_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902010141
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2019 19:32:53 -0000

Aaron,

Another option would be to look at the use of phosphor-fan-presence. The 
meta-ibm, romulus and witherspoon machines, configure each app (fan 
control, presence, monitoring) and contain the recipes to install them.


On 2/1/19 12:04 PM, Vijay Khemka wrote:
> Aron,
> You may also want to look at dbus-sensors as well. This is another approach for sensors through dbus. You have to include entity manager for this approach.
> 
> Regards
> -Vijay
> 
> ﻿On 1/31/19, 9:18 PM, "openbmc on behalf of Aaron Williams" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of awilliams@marvell.com> wrote:
> 
>      Thanks,
>      
>      I think I know what I need to do, after looking at the config example and
>      other yaml examples I've found. My problem is I haven't been able to find any
>      example recipes and whatnot that use this (or maybe I'm looking at the wrong
>      things). I've looked at the various implementations but don't see anything
>      using this.
>      
>      -Aaron
>      
>      On Thursday, January 31, 2019 7:30:04 AM PST Patrick Venture wrote:
>      > On Wed, Jan 30, 2019 at 8:49 PM Emily Shaffer <emilyshaffer@google.com>
>      wrote:
>      > > Aaron,
>      > >
>      > > If it's complaining at build time it's what it says on the box - you
>      > > probably need to include the recipe which builds
>      > > phosphor-fans-sensor-inventory.
>      > >
>      > > Emily
>      > >
>      > > On Wed, Jan 30, 2019, 8:17 PM Aaron Williams <awilliams@marvell.com>
>      wrote:
>      > >> Hi Emily,
>      > >>
>      > >> I'm still not sure how to go about using this, I'm still fairly new to
>      > >> OpenBMC. It's complaing about nothing providing
>      > >> 'virtual/phosphor-fans-sensor- inventory'.  I included
>      > >> phosphor-pid-control as one of our dependencies.
>      > Per Emily, you'll need to implement a recipe that defines the PID
>      > inputs.  It sounds like you have two PID loops.  One is the
>      > temperature sensor, and that feeds the set-point for the fans, which
>      > are a second PID loop.  The idea being, the temperature pid loop
>      > attempts to maintain the temperature under (or over) some set-point,
>      > and it'll in turn try to get the fans to speed up when necessary.
>      >
>      > >> -Aaron
>      > >>
>      > >> On Wednesday, January 30, 2019 1:48:10 PM PST you wrote:
>      > >> > Great, best luck Aaron. Thanks!
>      > >> >
>      > >> > On Wed, Jan 30, 2019, 1:47 PM Aaron Williams <awilliams@marvell.com>
>      wrote:
>      > >> > > Hi Emily,
>      > >> > >
>      > >> > > Thank you, I will look into it. I don't think losing the sensors when
>      > >> > > we
>      > >> > > cut
>      > >> > > power to the host CPU will be much of an issue. I was just notified
>      > >> > > of a
>      > >> > > change to our CPLD that will allow the BMC to keep the sensors
>      > >> > > powered. At
>      > >> > > the
>      > >> > > moment, cutting power shuts of the power from the ATX power supply
>      > >> > > but now
>      >
>      > As far as the sensors when the try is powered down, that's pretty
>      > common.  The hwmon driver on the BMC will just be unable to read the
>      > values, and you can deal with that in phosphor-hwmon a couple ways.
>      > Phosphor-pid-control will go into fail-safe mode if it doesn't receive
>      > a sensor value frequently enough.  This mode would cause it to drive
>      > the fans to a pre-defined set-point per a configuration.
>      >
>      > >> > > I
>      > >> > > will have more fine-grained power control. Now I just have to figure
>      > >> > > out
>      > >> > > how
>      > >> > > to update the Lattice CPLD from the BMC... I found some code in the
>      > >> > > Facebook
>      > >> > > OpenBMC which hopefully I can port over.
>      > >> > >
>      > >> > > -Aaron
>      > >> > >
>      > >> > > On Wednesday, January 30, 2019 1:42:40 PM PST Emily Shaffer wrote:
>      > >> > > > Aaron, we use this daemon for local (to BMC) thermal control:
>      > >> > > > https://github.com/openbmc/phosphor-pid-control
>      > >> > > > Maybe you'll find it helpful.
>      > >> > > >
>      > >> > > > Although I'm not sure how to help you with losing sensors when the
>      > >> > > > host
>      > >> > > > powers down but the BMC is expected to continue to cool the tray.
>      > >> > > > Sounds
>      > >> > > > like an issue with the board design, unless I'm not understanding
>      > >> > > > what
>      > >> > > > you're saying.
>      > >> > > >
>      > >> > > > On Wed, Jan 30, 2019 at 1:28 PM Aaron Williams
>      > >> > > > <awilliams@marvell.com>
>      > >> > > >
>      > >> > > > wrote:
>      > >> > > > > Hi Emily,
>      > >> > > > >
>      > >> > > > > That's what I need the temperature for. We have two controllers,
>      > >> > > > > one
>      > >> > >
>      > >> > > that
>      > >> > >
>      > >> > > > > monitors the core temperature (a TI TMP421) and one that controls
>      > >> > > > > the
>      > >> > >
>      > >> > > fans
>      > >> > >
>      > >> > > > > (ADT7462). In order to maintain the thermal envelope the TMP421
>      > >> > > > > needs
>      > >> > >
>      > >> > > to
>      > >> > >
>      > >> > > > > be
>      > >> > > > > monitored to adjust the fan speed through the ADT7462.
>      > >> > > > >
>      > >> > > > > Further complicating things is the fact that these sensors
>      > >> > > > > disappear
>      > >> > >
>      > >> > > when
>      > >> > >
>      > >> > > > > the
>      > >> > > > > host is powered down.
>      > >> > > > >
>      > >> > > > > -Aaron
>      > >> > > > >
>      > >> > > > > On Wednesday, January 30, 2019 9:49:32 AM PST Emily Shaffer
>      wrote:
>      > >> > > > > > External Email
>      > >> > >
>      > >> > > ---------------------------------------------------------------------
>      > >> > > -
>      > >> > >
>      > >> > > > > > Hi Aaron,
>      > >> > > > > >
>      > >> > > > > > Note that you only really need to worry about sending the
>      > >> > > > > > temperature
>      > >> > > > > > via
>      > >> > > > > > IPMI if you want to send it somewhere besides the BMC.  If you
>      > >> > > > > > plan
>      > >> > >
>      > >> > > to
>      > >> > >
>      > >> > > > > > do
>      > >> > > > > > internal thermal control (BMC reads temperature, BMC adjusts
>      > >> > > > > > fans
>      > >> > > > > > accordingly) you probably don't need IPMI config and can get
>      > >> > > > > > away
>      > >> > >
>      > >> > > with
>      > >> > >
>      > >> > > > > > setting it up as far as DBus in the sensor architecture doc Lei
>      > >> > > > > > sent.
>      > >> > > > > >
>      > >> > > > > > Emily
>      > >> > > > > >
>      > >> > > > > > On Thu, Jan 24, 2019 at 1:27 AM Lei YU <mine260309@gmail.com>
>      wrote:
>      > >> > > > > > > On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <
>      > >> > >
>      > >> > > awilliams@marvell.com>
>      > >> > >
>      > >> > > > > > > wrote:
>      > >> > > > > > > > I see how to set up the hwmon portion defining the devices
>      > >> > > > > > > > based
>      > >> > >
>      > >> > > on
>      > >> > >
>      > >> > > > > the
>      > >> > > > >
>      > >> > > > > > > device
>      > >> > > > > > >
>      > >> > > > > > > > tree, but I am unsure how to go about configuring the YAML
>      > >> > > > > > > > and
>      > >> > >
>      > >> > > other
>      > >> > >
>      > >> > > > > > > files for
>      > >> > > > > > >
>      > >> > > > > > > > this.
>      > >> > > > > > >
>      > >> > > > > > > For sensors' config, please refer to
>      > >> > > > > > > https://github.com/openbmc/docs/blob/master/sensor-architectu
>      > >> > > > > > > re.md
>      > >> > > > > > >
>      > >> > > > > > > And it looks you are looking for fan controls, then you could
>      > >> > >
>      > >> > > refer
>      > >> > > to:
>      > >> > >
>      > >> > > https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide
>      > >> > > .md#f
>      > >> > >
>      > >> > > > > > > ans
>      > >> > > > > > >
>      > >> > > > > > > (I really need to submit my porting guide to openbmc/docs)
>      
>      
>      
>      
>      
> 
