Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9N0C3XlVzDt2k
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 00:26:35 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA4DOBLq020462
 for <openbmc@lists.ozlabs.org>; Fri, 4 Nov 2016 09:26:33 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26gqfu03k6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 09:26:31 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 4 Nov 2016 09:26:30 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 4 Nov 2016 09:26:27 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 50C13C9003E;
 Fri,  4 Nov 2016 09:26:11 -0400 (EDT)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA4DQQEf10289574; Fri, 4 Nov 2016 13:26:26 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58D69112040;
 Fri,  4 Nov 2016 09:26:26 -0400 (EDT)
Received: from [9.79.197.135] (unknown [9.79.197.135])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 9A64D112054;
 Fri,  4 Nov 2016 09:26:23 -0400 (EDT)
Subject: Re: IPMI LAN command story design - try 3rd send
To: Li Nan <william.bjlinan@hotmail.com>, Patrick Williams <patrick@stwcx.xyz>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Fri, 4 Nov 2016 18:56:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------020106080907000409010108"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16110413-0056-0000-0000-000001D3F4D7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006032; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00776680; UDB=6.00373650; IPR=6.00553826; 
 BA=6.00004857; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013214; XFM=3.00000011;
 UTC=2016-11-04 13:26:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16110413-0057-0000-0000-00000607140D
Message-Id: <581C8C7D.8080702@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-04_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611040254
X-Mailman-Approved-At: Sat, 05 Nov 2016 01:05:03 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 13:26:36 -0000

This is a multi-part message in MIME format.
--------------020106080907000409010108
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nan,

The Set Channel access command was decided to be used to mark the end of 
a setting LAN configuration transaction.
The patchset logically matches with using 'Set Channel Access' to mark 
the end of set LAN configuration and
apply the data from the cache.

Regards,
Tom


On Thursday 03 November 2016 09:52 PM, Li Nan wrote:
>
> Hi, Tom,
>
> I show my #444 ( story: Confirm LAN device command meet IPMI 2.0 
> requirements ) implementation below. Want to clarify  that how it works.
>
>
> We did some experiments, so we got that ipmitool would issue "set lan 
> parameter" command like below:
> For instance, change ip address.
> After we sent "ipmitool -I dbus lan set 1 ipaddr 1.2.3.4", ipmitool 
> would do:
> (1)sent Get Channel Info command.
> (2)echo "Setting LAN IP Address to 1.2.3.4" to the shell.
> (3)sent Get LAN command to fetch the value of "set in progress"(which 
> is 0x0) .
> (4)sent Set LAN command to change "set in progress" parameter to "Set 
> in Progress"(0x1).
> (5)sent Get LAN command to fetch the value of "set in progress"( which 
> is 0x1) .
> (6)sent Set LAN command to set "ip address" with value of "A.B.C.D".
> (7)sent Get LAN command to fetch value of ip address.
> (8)sent Set LAN command to "commit write" by setting "set in progress" 
> to 0x2.
> (9)sent Set LAN command to set "set in progress " to "set complete"(0x0).
>
>
> Because ipmitool would work like that, so we decided to use 2 steps to 
> issue the changing of lan parameter:
> Step 1:
> Using Set LAN parameter command to cache the user setting.  User can 
> input one item at a time to cache. So user can put items into cache 
> one be one in sequence.
>
> Step 2:
> Using Set Channel Access to apply those cached items.
>
> So the mechanism of my implementation is following above steps? right?
> https://gerrit.openbmc-project.xyz/#/c/822/
>
>
> B.R.
> Nan
>
>
> ------------------------------------------------------------------------
> *From:* openbmc 
> <openbmc-bounces+william.bjlinan=hotmail.com@lists.ozlabs.org> on 
> behalf of Li Nan <william.bjlinan@hotmail.com>
> *Sent:* Monday, October 17, 2016 2:55 PM
> *To:* Patrick Williams; tomjose; Adriana Kobylak
> *Cc:* OpenBMC Maillist
> *Subject:* RE: IPMI LAN command story design - try 3rd send
>
> Hi all,
>
> I summarize IPMI LAN command flow here after our discussion.
>
>
> When we want to change single ip address/Subnet mask/Gateway address, 
> ipmitool (the openbmc/ipmitool) will automatically use a set of 
> command to accomplish it, it works like below:
> ex. we want to change ip address.
> After we send "ipmitool -I dbus lan set 1 ipaddr A.B.C.D", ipmitool 
> will do:
> (1)send Get Channel Info command.
> (2)echo "Setting LAN IP Address to A.B.C.D" to shell.
> (3)send Get LAN command to fetch the value of "set in progress"(which 
> is 0x0) .
> (4)send Set LAN command to change "set in progress" parameter to "Set 
> in Progress"(0x1).
> (5)send Get LAN command to fetch the value of "set in progress"( which 
> is 0x1) .
> (6)send Set LAN command to set "ip address" with value of "A.B.C.D".
> (7)send Get LAN command to fetch value of ip address.
> (8)send Set LAN command to "commit write" by setting "set in progress" 
> to 0x2.
> (9)send Set LAN command to set "set in progress " to "set complete"(0x0).
>
> It seems like ipmitool (some version) will automatically send SET LAN 
> command to change the value of "set in progress" parameter. So "set in 
> progress" can be used to identify a transaction.  The value of "set in 
> progress" can tell us the state of the procedure.
>
> I do my work  by using "set in progress" to apply the user settings.
> (1) If user want to change only single setting of "ip address/subnet 
> mask/gateway address ",
>       The ipmid will cache the user setting, and wait for "set 
> complete"("set in progress" parameter value is 0x0).             When 
> ipmid receives "set complete", it will apply this user setting and the 
> other two reserved settings fetched   from dbus(netman.py).
>     a. If ipmitool don't send "set complete" automatically, user can 
> send raw command to send it.
>     b. We also can send "set complete" in the implementation of "set 
> channel access" command mentioned by Tom.
> So it will looks like that single setting will be applied right away.
>
> (2)If user want to change two or three settings at the same time:
>      a. If the "set complete" don't be sent automatically by ipmitool( 
> some version ).
>          The user can send settings one by one, and then use a raw 
> command(set complete) to apply them.
>          It will works when running from local shell (accessing it 
> from serial port) or remote interface.
>      b. If the "set complete" is sent automatically by ipmitool.
>          So the single change will be applied immediately, the user 
> can operate from a local interface.
>
> Please correct me!
> Thanks!
>
>
> ------------------------------------------------------------------------
> *寄件者:* Patrick Williams <patrick@stwcx.xyz>
> *寄件日期:* 2016年10月4日 上午 09:51
> *收件者:* tomjose
> *副本:* Li Nan; OpenBMC Maillist
> *主旨:* Re: IPMI LAN command story design - try 3rd send
> Forwarding to list.
>
> On Tue, Oct 04, 2016 at 03:02:54PM +0530, tomjose wrote:
> > Hello Nan,
> >
> > The current implementation mandates the user to enter <IP
> > Address>,<NetMask> and <Gateway>
> > for the network settings to be changed. Even though the user wants to
> > change only the IP
> > address , because of the way we have implemented we are forcing the 
> user
> > to enter all the three details.
> >
> > The LAN settings is a property of the channel(Channel 1 typically
> > corresponds to ETH0) and we can leverage
> > the "Set Channel Access" command to apply the settings.We can apply the
> > network settings whenever the
> > Access Mode is turned on.(ipmitool lan set 1 access on)
> >
> > With the solution i am thinking , the Set LAN configuration command
> > would not be used to apply the network
> > settings but it would be used to cache the network settings and it 
> would
> > be applied when the Set Channel Access
> > command is called.
> >
> > The following link explains the order of commands.
> >
> > 
> https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool(LAN 
> <https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool%28LAN> 
>
> > Configuration section)
> >
> > Regarding #2 - Authentication Type Support, it seems that this section
> > is not updated properly.
> > Get Channel Authentication capabilities is the first command issued for
> > a session setup.
> > This command also has the same Authentication type support field and 
> the
> > 7th bit which
> > was reserved in #2 is used in this command to specify IPMI2.0 and
> > IPMI1.5 authentication
> > capabilities.
> >
> > So since #2 is outdated to represent the necessary authentication
> > capabilities, i think we do
> > not need to support parameter #2.
> >
> > Regarding #3 - Authentication Type Enables - this is needed if we
> > support different authentication
> > types for different requested privilege levels. Since the 
> authentication
> > types are outdated  and we
> > do not support different authentication types per privilege levels, we
> > can avoid this parameter.
> >
> > Thanks,
> > Tom
> >
> >
> >
> >
> > On Monday 03 October 2016 07:29 PM, Li Nan wrote:
> > >
> > > Hi team,
> > >
> > > I'm working on the story of Confirm LAN Command meet IPMI 2.0
> > > https://github.com/openbmc/openbmc/issues/444 
> <https://github.com/openbmc/openbmc/issues/444>
> > >
> > >
> > > <https://github.com/openbmc/openbmc/issues/444>
> > >
> > > I summarize some fields of settings below, and need some help to
> > > confirm the direction of my work.
> > >
> > > ```
> > >
> > >
> > >   1.IPMI LAN command status and work plan
> > >
> > >
> > >     1.1.Current status
> > >
> > > IPMI LAN command consists of 4 command ( refer to IPMI 2.0 Spec,
> > > Chapter 23 ):Set LAN Configuration Parameters, Get LAN Configuration
> > > Parameters, Suspend BMC ARPs and Get IP/UDP/RMCP Statistics.
> > >
> > > Existing code includes implementation of Set/Get LAN configuration
> > > Parameters. ( Refer to
> > > 
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp 
>
> <https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp>
> 	
> openbmc/phosphor-host-ipmid 
> <https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp>
> github.com
> phosphor-host-ipmid - dbus-based ipmid for host-endpoint IPMI commands
>
>
> > > )
> > >
> > >
> > >     1.2.IPMI LAN Command Handling
> > >
> > > Example for Set LAN Configuration Parameters.
> > >
> > > Parameter
> > >
> > >
> > >
> > > #
> > >
> > > Number
> > >
> > >
> > >
> > > IPMI handling
> > >
> > >
> > >
> > > dbus method
> > >
> > > Set In Progress(Volatile)
> > >
> > >
> > >
> > > 0
> > >
> > >
> > >
> > > phosphor-host-ipmid/transporthandler.cpp, Line 209.
> > >
> > > variable lan_set_in_progress act as a statemachine.
> > >
> > >
> > >
> > > No need.
> > >
> > > Authentication Type Support(Read Only)
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > phosphor-host-ipmid/transporthandler.cpp, Line 305.
> > >
> > > Setto 0x4 (MD5)
> > >
> > >
> > >
> > > No need.
> > >
> > > Authentication Type
> > >
> > > Enables
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > > phosphor-host-ipmid/transporthandler.cpp, Line 311.
> > >
> > > Set to 0x4, 0x4, 0x4, 0x4, 0x4.
> > >
> > >
> > >
> > > No need.
> > >
> > > IP Address
> > >
> > >
> > >
> > > 3
> > >
> > >
> > >
> > > phosphor-host-ipmid/transporthandler.cpp, Line 169.
> > >
> > >
> > >
> > > phosphor-neworkd/netman.py: Line 266: SetAddress4
> > >
> > > MAC Address
> > >
> > > (can be Read Only)
> > >
> > >
> > >
> > > 5
> > >
> > >
> > >
> > > phosphor-host-ipmid/transporthandler.cpp, Line 174.
> > >
> > >
> > >
> > > phosphor-neworkd/netman.py: Line 334: SetHwAddress.
> > >
> > > Subnet Mask
> > >
> > >
> > >
> > > 6
> > >
> > >
> > >
> > > phosphor-host-ipmid/transporthandler.cpp, Line 199.
> > >
> > >
> > >
> > > phosphor-neworkd/netman.py: Line 266: SetAddress4
> > >
> > > Default Gateway Address
> > >
> > >
> > >
> > > 12
> > >
> > >
> > >
> > > phosphor-host-ipmid/transporthandler.cpp, Line 204.
> > >
> > >
> > >
> > > phosphor-neworkd/netman.py: Line 266: SetAddress4
> > >
> > > Handling of Get LAN Configuration Parameters command is similar to 
> Set
> > > LAN Configuration Parameters. Refer to
> > > phosphor-host-ipmid/transporthandler.cpp and 
> phosphor-networkd/netman.py.
> > >
> > >
> > >     1.3.Gap between current code and IPMI Spec 2.0
> > >
> > > LAN Configuration Parameter List
> > >
> > > Parameter
> > >
> > >
> > >
> > > #
> > >
> > > Number
> > >
> > >
> > >
> > > Parameter Data( non-volatile unless otherwise noted )
> > >
> > >
> > >
> > > Bit field
> > >
> > >
> > >
> > > Description
> > >
> > >
> > >
> > > Current status/Note
> > >
> > > ( Yes = current support.
> > >
> > > No = not support. )
> > >
> > > Set In Progress(Volatile)
> > >
> > >
> > >
> > > 0
> > >
> > >
> > >
> > > byte 1
> > >
> > >
> > >
> > >
> > >
> > > 00b -= set complete
> > >
> > > 0ab = set in progress
> > >
> > > 10b = commit write
> > >
> > > 11b = reserved
> > >
> > >
> > >
> > > Yes
> > >
> > > Authentication Type Support(Read Only)
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > byte 1
> > >
> > >
> > >
> > >
> > >
> > > Authentication type(s) enabled for this channel(bi0tfield):
> > >
> > > All bits: 1b =supported
> > >
> > > 0b= authentication type not available for use.
> > >
> > > [5] – OEM proprietary
> > >
> > > [4] – straight password / key
> > >
> > > [3] – reserved
> > >
> > > [2] – MD5
> > >
> > > [1] – MD2
> > >
> > > [0] - none
> > >
> > >
> > >
> > > Yes.
> > >
> > > MD5
> > >
> > > Authenticaton Type
> > >
> > > Enables
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > This field is used to configure which Authentication Types are
> > > available for use when a remote console activates an IPMI messaging
> > > connection to the BMC for a given requested maximum privilege level.
> > >
> > >
> > >
> > > Yes.
> > >
> > > MD5
> > >
> > > IP Address
> > >
> > >
> > >
> > > 3
> > >
> > >
> > >
> > > data 1:4
> > >
> > > MS-byte first
> > >
> > >
> > >
> > >
> > >
> > > IP Address
> > >
> > >
> > >
> > > Yes
> > >
> > > IP Address Source
> > >
> > >
> > >
> > > 4
> > >
> > >
> > >
> > > data1
> > >
> > >
> > >
> > >
> > >
> > > address source
> > >
> > > 0h – unspecified
> > >
> > > 1h = static address (manually configured)
> > >
> > > 2h = address obtained by BMC running DHCP
> > >
> > > 3h = address loaded by BIOS or system software
> > >
> > > 4h = address obtained by BMC running other address assignment protocol
> > >
> > >
> > >
> > > No.
> > >
> > > MAC Address
> > >
> > > (can be Read Only)
> > >
> > >
> > >
> > > 5
> > >
> > >
> > >
> > > data 1:6
> > >
> > >
> > >
> > >
> > >
> > > MAC Address for messages transmitted from BMC.
> > >
> > > MS-byte first.
> > >
> > >
> > >
> > > Yes.
> > >
> > > Subnet Mask
> > >
> > >
> > >
> > > 6
> > >
> > >
> > >
> > > data1:4
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > Yes
> > >
> > > IPv4 Header Parameter
> > >
> > >
> > >
> > > 7
> > >
> > >
> > >
> > > data1
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No
> > >
> > > Primary RMCP Port Number(optional)
> > >
> > >
> > >
> > > 8
> > >
> > >
> > >
> > > data1:2
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Secondary RMCP Port Number(optional)
> > >
> > >
> > >
> > > 9
> > >
> > >
> > >
> > > data1:2
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > BMC-generated ARP control (optional)
> > >
> > >
> > >
> > > 10
> > >
> > >
> > >
> > > data1
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Gratuitous ARP interval (optional)
> > >
> > >
> > >
> > > 11
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Default GatewayAddress
> > >
> > >
> > >
> > > 12
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > Yes
> > >
> > > Default Gateway MAC Address
> > >
> > >
> > >
> > > 13
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Backup Gateway Address
> > >
> > >
> > >
> > > 14
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Backup Gateway MAC Address
> > >
> > >
> > >
> > > 15
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Community String
> > >
> > >
> > >
> > > 16
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Number of Destinations( Read Only )
> > >
> > >
> > >
> > > 17
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Destination Type (volatile / non-volatile – see description )
> > >
> > >
> > >
> > > 18
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Destination Address
> > >
> > >
> > >
> > > 19
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Following parameters are introduced with IPMI v2.0/RMCP+
> > >
> > > 802.1q VLAN ID (12-bit)
> > >
> > >
> > >
> > > 20
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > 802.1q VLAN Priority
> > >
> > >
> > >
> > > 21
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > RMCP+ Messaging Cipher Suite Entry Support( Read Only )
> > >
> > >
> > >
> > > 22
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > RMCP+ Messaging Cipher Suite Entries( Read Only )
> > >
> > >
> > >
> > > 23
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > RMCP+ Messaging Cipher Suite Privilege Levels
> > >
> > >
> > >
> > > 24
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Destination Address VLAN TAGs
> > >
> > >
> > >
> > > 25
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Bad Password Threshold
> > >
> > >
> > >
> > > 26
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6/IPv4 Support
> > >
> > >
> > >
> > > 50
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6/IPv4 Addressing Enables
> > >
> > >
> > >
> > > 51
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6/IPv4 Header Static Traffic Class
> > >
> > >
> > >
> > > 52
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Header Static Hop Limit
> > >
> > >
> > >
> > > 53
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Header Flow Label
> > >
> > >
> > >
> > > 54
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Status
> > >
> > >
> > >
> > > 55
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Addresses
> > >
> > >
> > >
> > > 56
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 DHCPv6 Static DUID storage length
> > >
> > >
> > >
> > > 57
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 DHCPv6 Static DUIDs
> > >
> > >
> > >
> > > 58
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Dynamic ( SLAAC/DHCPv6) Address
> > >
> > >
> > >
> > > 59
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 DHCPv6 Dynamic DUID storage length
> > >
> > >
> > >
> > > 60
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 DHCPv6 Dynamic DUIDs
> > >
> > >
> > >
> > > 61
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 DHCPv6 Timing Configuration Support
> > >
> > >
> > >
> > > 62
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 DHCPv6 Timing & Configuration
> > >
> > >
> > >
> > > 63
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Router Address Configuration Control
> > >
> > >
> > >
> > > 64
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 1 IP Address
> > >
> > >
> > >
> > > 65
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 1 MAC Address
> > >
> > >
> > >
> > > 66
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 1 Prefix Length
> > >
> > >
> > >
> > > 67
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 1 Prefix Value
> > >
> > >
> > >
> > > 68
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 2 Address
> > >
> > >
> > >
> > > 69
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 2 MAC Address
> > >
> > >
> > >
> > > 70
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 2 Prefix Length
> > >
> > >
> > >
> > > 71
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Static Router 2 Prefix Value
> > >
> > >
> > >
> > > 72
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > Number of Dynamic Router Info Sets
> > >
> > >
> > >
> > > 73
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Dynamic Router Info IP Address
> > >
> > >
> > >
> > > 74
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Dynamic Router Info MAC Address
> > >
> > >
> > >
> > > 75
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Dynamic Router Info Prefix Length
> > >
> > >
> > >
> > > 76
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Dynamic Router Info Prefix Value
> > >
> > >
> > >
> > > 77
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Dynamic Router Received Hop Limit
> > >
> > >
> > >
> > > 78
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Neighbor Discovery / SLAAC Timing Configuration Support
> > >
> > >
> > >
> > > 79
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > IPv6 Neighbor Discovery / SLAAC Timing Configuration
> > >
> > >
> > >
> > > 80
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > > OEM Parameters
> > >
> > >
> > >
> > > 192:255
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > No.
> > >
> > >
> > >     1.4.Work Plan
> > >
> > >
> > >       1.4.1.Set LAN Configuration Parameters
> > >
> > >
> > >       1.4.2.Get LAN Configuration Parameters
> > >
> > > I figure out what we support in phosphor-netwokd repo ( Refer to:
> > >
> > > https://github.com/openbmc/phosphor-networkd/blob/master/netman.py 
> ) :
> <https://github.com/openbmc/phosphor-networkd/blob/master/netman.py>
> 	
> openbmc/phosphor-networkd 
> <https://github.com/openbmc/phosphor-networkd/blob/master/netman.py>
> github.com
> Contribute to phosphor-networkd development by creating an account on 
> GitHub.
>
>
> > >
> > >   * Set In Progress,
> > >   * Authentication Type Support,
> > >   * Authentication Type Enables,
> > >   * IP Address,
> > >   * MAC Address,
> > >   * Subnet Mask,
> > >   * Default Gateway Address
> > >
> > > So I think we only support existing configuration.
> > >
> > > How can I implement the rest of the configurations/parameters? (open
> > > issues?)
> > >
> > >
> > >       1.4.3.ARP
> > >
> > > Not implemented in Tom’s IPMI network story.
> > >
> > > Should I refer to
> > > 
> openbmc/import-layers/meta-openembedded/meta-networking/recipes-support/arptables
> > > ?
> > >
> > > Optional command. Not to implement?
> > >
> > >
> > >       1.4.4.IP/UDP/RMCP statistics
> > >
> > > Seems like it was not implemented in obmc stories too.
> > >
> > > This is an optional command. Not to implement?
> > >
> > >
> > >   2.IPMI LAN Commands in IPMI Spec 2.0 -- Format
> > >
> > >
> > >     1.1.Set LAN Configuration Parameters command
> > >
> > > Set LAN Configuration Parameters command
> > >
> > >
> > >
> > > Byte
> > >
> > >
> > >
> > > Bit field
> > >
> > >
> > >
> > > Description
> > >
> > >
> > >
> > > Support
> > >
> > > Request Data
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > [7:4]
> > >
> > >
> > >
> > > reserved
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [3:0]
> > >
> > >
> > >
> > > Channel number
> > >
> > >
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > >
> > >
> > > Parameter selector
> > >
> > >
> > >
> > >
> > >
> > > 3:N
> > >
> > >
> > >
> > >
> > >
> > > Configuration parameter data
> > >
> > >
> > >
> > > Response Data
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > Completion code
> > >
> > >
> > >
> > > 80h = parameter not supported.
> > >
> > > 81h = attempt to set the ‘set in progress’ value (in parameter #0)
> > > when not in the ‘set complete’ state. (This completion code 
> provides a
> > > way to recognize that another party has already ‘claimed’ the 
> parameters)
> > >
> > > 82h = attempt to write read-only parameter
> > >
> > > 83h = attempt to read write-only parameter
> > >
> > >
> > >
> > > Existing code supports 7 LAN command:
> > >
> > > Set In Progress,
> > >
> > > Authentication Type Support,
> > >
> > > Authentication Type Enables,
> > >
> > > IP Address,
> > >
> > > MAC Address,
> > >
> > > Subnet Mask,
> > >
> > > Default Gateway Address.
> > >
> > > Refer to:
> > >
> > > https://github.com/openbmc/phosphor-networkd/blob/master/netman.py
> <https://github.com/openbmc/phosphor-networkd/blob/master/netman.py>
> 	
> openbmc/phosphor-networkd 
> <https://github.com/openbmc/phosphor-networkd/blob/master/netman.py>
> github.com
> Contribute to phosphor-networkd development by creating an account on 
> GitHub.
>
>
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >     1.2.Get LAN Configuration Parameters Command
> > >
> > > Get LAN Configuration Parameters Command
> > >
> > >
> > >
> > > Byte
> > >
> > >
> > >
> > > Bit field
> > >
> > >
> > >
> > > Description
> > >
> > >
> > >
> > > Support
> > >
> > > Request Data
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > [7]
> > >
> > >
> > >
> > > 0b = get parameter
> > >
> > > 1b = get parameter revision only
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [6:4]
> > >
> > >
> > >
> > > reserved
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [3:0]
> > >
> > >
> > >
> > > Channel number
> > >
> > >
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > >
> > >
> > > Parameter selector
> > >
> > >
> > >
> > >
> > >
> > > 3
> > >
> > >
> > >
> > >
> > >
> > > Set Selector. Selects a given set of parameters under a given
> > > Parameter selector value.
> > >
> > > 00h if parameter don’t use a Set Selector.
> > >
> > >
> > >
> > >
> > >
> > > 4
> > >
> > >
> > >
> > >
> > >
> > > Block Selector (00h if parameter does not require a block number)
> > >
> > >
> > >
> > > Response Data
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > [7:0]
> > >
> > >
> > >
> > > Completion Code.
> > >
> > > Generic codes, plus following command-specific completion code(s):
> > >
> > > 80h = parameter not supported.
> > >
> > >
> > >
> > > Existing code supports 7 LAN command:
> > >
> > > Set In Progress,
> > >
> > > Authentication Type Support,
> > >
> > > Authentication Type Enables,
> > >
> > > IP Address,
> > >
> > > MAC Address,
> > >
> > > Subnet Mask,
> > >
> > > Default Gateway Address.
> > >
> > > Refer to
> > > https://github.com/openbmc/phosphor-networkd/blob/master/netman.py
> <https://github.com/openbmc/phosphor-networkd/blob/master/netman.py>
> 	
> openbmc/phosphor-networkd 
> <https://github.com/openbmc/phosphor-networkd/blob/master/netman.py>
> github.com
> Contribute to phosphor-networkd development by creating an account on 
> GitHub.
>
>
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > > [7:0]
> > >
> > >
> > >
> > > Parameter revision.
> > >
> > > Format: MSN = present revision. LSN = oldest revision parameter is
> > > backward compatible with. 11h for parameters in this specification.
> > >
> > >
> > >
> > > The following data bytes are not returned when the ‘get parameter
> > > revision only’ bit is 1b.
> > >
> > >
> > >
> > > 3:N
> > >
> > >
> > >
> > >
> > >
> > > Configuration parameter data.
> > >
> > > If the rollback feature is implemented, the BMC makes a copy of the
> > > existing parameters when the ‘set in progress’ state becomes asserted
> > > (See the Set in Progress parameter #0). While the ‘set in progress’
> > > state is active, the BMC will return data from this copy of the
> > > parameters, plus any uncommitted changes that were made to data.
> > > Otherwise, the BMC returns parameter data from non-volatile storage.
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >       1.2.1.DHCPv6 Timing Parameters
> > >
> > > Not support.
> > >
> > >
> > >       1.2.2.Neighbor discovery / SLAAC Timing Parameters
> > >
> > > Not support.
> > >
> > >
> > >     1.3.Suspend BMC ARPs command
> > >
> > > Suspend BMC ARPs Command
> > >
> > >
> > >
> > > Byte
> > >
> > >
> > >
> > > Bit field
> > >
> > >
> > >
> > > Description
> > >
> > >
> > >
> > > Support
> > >
> > > Request
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > [7:4]
> > >
> > >
> > >
> > > Reserved
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [3:0]
> > >
> > >
> > >
> > > Channel number
> > >
> > >
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > > [7:2]
> > >
> > >
> > >
> > > Reserved
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [1]
> > >
> > >
> > >
> > > ARP response suspend.
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [0]
> > >
> > >
> > >
> > > Gratuitous ARP suspend
> > >
> > >
> > >
> > > Respond
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > >
> > >
> > > Completion code
> > >
> > >
> > >
> > > Do not support.
> > >
> > > ( Should refer to
> > >
> > > 
> openbmc/import-layers/meta-openembedded/meta-networking/recipes-support/arptables?
> > > )
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > >
> > >
> > > present state o f ARP suspension
> > >
> > >
> > >
> > >
> > >
> > > [7:2]
> > >
> > >
> > >
> > > reserve
> > >
> > >
> > >
> > >
> > >
> > > [1]
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [0]
> > >
> > >
> > >
> > > Address Resolution Protocol.
> > >
> > >
> > >     1.4.Get IP/UDP/RMCP Statistics Command
> > >
> > > Get IP/UDP/RMCP Statistics Command
> > >
> > >
> > >
> > > Byte
> > >
> > >
> > >
> > > Bit field
> > >
> > >
> > >
> > > Description
> > >
> > >
> > >
> > > Support
> > >
> > > Request Data
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > > [7:4]
> > >
> > >
> > >
> > > reserved
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [3:0]
> > >
> > >
> > >
> > > Channel number
> > >
> > >
> > >
> > >
> > >
> > > 2
> > >
> > >
> > >
> > > [7:1]
> > >
> > >
> > >
> > > clear statistics
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > [0]
> > >
> > >
> > >
> > >
> > >
> > > Respond Data
> > >
> > >
> > >
> > > 1
> > >
> > >
> > >
> > >
> > >
> > > Completion Code
> > >
> > >
> > >
> > > RMCP is implemented in openbmc.
> > >
> > > Refer to
> > >
> > > https://github.com/openbmc/openbmc/issues/432 
> <https://github.com/openbmc/openbmc/issues/432> and so on.
> <https://github.com/openbmc/openbmc/issues/432>
> 	
> Attaching RMCP session to SOL. · Issue #432 · openbmc/openbmc 
> <https://github.com/openbmc/openbmc/issues/432>
> github.com
> openbmc - OpenBMC Distribution
>
>
> > >
> > > Discussed with Tom, these statistics is not implemented in
> > > phosphor-networkd.
> > >
> > >
> > >
> > > 2:3
> > >
> > >
> > >
> > >
> > >
> > > IP Packets Received.
> > >
> > >
> > >
> > > 4:5
> > >
> > >
> > >
> > >
> > >
> > > Received IP Header Errors
> > >
> > >
> > >
> > > 6:7
> > >
> > >
> > >
> > >
> > >
> > > Received IP Address Errors
> > >
> > >
> > >
> > > 8:9
> > >
> > >
> > >
> > >
> > >
> > > Fragmented IP Packets Received
> > >
> > >
> > >
> > > 10:11
> > >
> > >
> > >
> > >
> > >
> > > IP Packets Transmitted
> > >
> > >
> > >
> > > 12:13
> > >
> > >
> > >
> > >
> > >
> > > UDP Packets Received
> > >
> > >
> > >
> > > 14:15
> > >
> > >
> > >
> > >
> > >
> > > Valid RMCP Received
> > >
> > >
> > >
> > > 16:17
> > >
> > >
> > >
> > >
> > >
> > > UDP Proxy Packets Received
> > >
> > >
> > >
> > > 18:19
> > >
> > >
> > >
> > >
> > >
> > > UDP Proxy Packets dropped
> > >
> > >
> > >   3.End
> > >
> > > ```
> > >
> > >
> > >
> > >
> > > _______________________________________________
> > > openbmc mailing list
> > > openbmc@lists.ozlabs.org
> > > https://lists.ozlabs.org/listinfo/openbmc 
> <https://lists.ozlabs.org/listinfo/openbmc>
> openbmc Info Page - OzLabs <https://lists.ozlabs.org/listinfo/openbmc>
> lists.ozlabs.org
> To see the collection of prior postings to the list, visit the openbmc 
> Archives. Using openbmc: To post a message to all the list members, 
> send email ...
>
>
> >
>
> -- 
> Patrick Williams
>


--------------020106080907000409010108
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Nan,<br>
    <br>
    The Set Channel access command was decided to be used to mark the
    end of a setting LAN configuration transaction.<br>
    The patchset logically matches with using 'Set Channel Access' to
    mark the end of set LAN configuration and<br>
    apply the data from the cache.<br>
    <br>
    Regards,<br>
    Tom<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On Thursday 03 November 2016 09:52 PM,
      Li Nan wrote:<br>
    </div>
    <blockquote
cite="mid:TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"><!-- P {margin-top:0;margin-bottom:0;} --></style>
      <div id="divtagdefaultwrapper"
style="font-size:12pt;color:#000000;font-family:Calibri,Arial,Helvetica,sans-serif;">
        <p>Hi, Tom,</p>
        <p>I show my #444 ( story: Confirm LAN device command meet IPMI
          2.0 requirements ) implementation below. Want to clarify  that
          how it works.<br>
        </p>
        <br>
        We did some experiments, so we got that ipmitool would issue
        "set lan parameter" command like below:<br>
        <div>For instance, change ip address.<br>
          After we sent "ipmitool -I dbus lan set 1 ipaddr 1.2.3.4",
          ipmitool would do:<br>
          (1)sent Get Channel Info command.<br>
          (2)echo "Setting LAN IP Address to 1.2.3.4" to the shell.<br>
          (3)sent Get LAN  <span>command to </span>fetch the value of
          "set in progress"(which is 0x0) .<br>
          (4)sent Set LAN command to change "set in progress" parameter
          to "Set in Progress"(0x1).<br>
          (5)sent Get LAN  <span>command to </span>fetch the value of
          "set in progress"( which is 0x1) .<br>
          (6)sent Set LAN command to set "ip address" with value of
          "A.B.C.D".<br>
          (7)sent Get LAN command to fetch value of ip address.<br>
          (8)sent Set LAN command to "commit write" by setting "set in
          progress" to 0x2.<br>
          (9)sent Set LAN command to set "set in progress " to "set
          complete"(0x0).</div>
        <br>
        <br>
        Because ipmitool would work like that, so we decided to use 2
        steps to issue the changing of lan parameter:<br>
        Step 1: <br>
        Using Set LAN parameter command to cache the user setting.  User
        can input one item at a time to cache. So user can put items
        into cache one be one in sequence.<br>
        <br>
        Step 2: <br>
        Using Set Channel Access to apply those cached items.<br>
        <br>
        So the mechanism of my implementation is following above steps?
        right?<br>
        <a moz-do-not-send="true" previewremoved="true" id="LPlnk717207"
          href="https://gerrit.openbmc-project.xyz/#/c/822/"
          class="OWAAutoLink">https://gerrit.openbmc-project.xyz/#/c/822/</a><br>
        <br>
        <br>
        B.R.<br>
        Nan<br>
        <br>
        <br>
        <div style="color: rgb(0, 0, 0);">
          <hr tabindex="-1" style="display:inline-block; width:98%">
          <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
              face="Calibri, sans-serif" color="#000000"><b>From:</b>
              openbmc
              <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+william.bjlinan=hotmail.com@lists.ozlabs.org">&lt;openbmc-bounces+william.bjlinan=hotmail.com@lists.ozlabs.org&gt;</a>
              on behalf of Li Nan <a class="moz-txt-link-rfc2396E" href="mailto:william.bjlinan@hotmail.com">&lt;william.bjlinan@hotmail.com&gt;</a><br>
              <b>Sent:</b> Monday, October 17, 2016 2:55 PM<br>
              <b>To:</b> Patrick Williams; tomjose; Adriana Kobylak<br>
              <b>Cc:</b> OpenBMC Maillist<br>
              <b>Subject:</b> RE: IPMI LAN command story design - try
              3rd send</font>
            <div> </div>
          </div>
          <div>
            <div id="divtagdefaultwrapper" style="font-size:12pt;
              color:#000000;
              font-family:Calibri,Arial,Helvetica,sans-serif">
              <p>Hi all,</p>
              <p>I summarize IPMI LAN command flow here after our
                discussion.</p>
              <p><br>
              </p>
              When we want to change single ip address/Subnet
              mask/Gateway address, ipmitool (the openbmc/ipmitool) will
              automatically use a set of command to accomplish it, it
              works like below:<br>
              ex. we want to change ip address.<br>
              After we send "ipmitool -I dbus lan set 1 ipaddr A.B.C.D",
              ipmitool will do:<br>
              (1)send Get Channel Info command.<br>
              (2)echo "Setting LAN IP Address to A.B.C.D" to shell.<br>
              (3)send Get LAN  <span>command to </span>fetch the value
              of "set in progress"(which is 0x0) .<br>
              (4)send Set LAN command to change "set in progress"
              parameter to "Set in Progress"(0x1).<br>
              (5)send Get LAN  <span>command to </span>fetch the value
              of "set in progress"( which is 0x1) .<br>
              (6)send Set LAN command to set "ip address" with value of
              "A.B.C.D".<br>
              (7)send Get LAN command to fetch value of ip address.<br>
              (8)send Set LAN command to "commit write" by setting "set
              in progress" to 0x2.<br>
              (9)send Set LAN command to set "set in progress " to "set
              complete"(0x0).<br>
              <br>
              It seems like ipmitool (some version) will automatically
              send SET LAN command to change the value of "set in
              progress" parameter. So "set in progress" can be used to
              identify a transaction.  The value of "set in progress"
              can tell us the state of the procedure.<br>
              <br>
              I do my work  by using "set in progress" to apply the user
              settings.<br>
              (1) If user want to change only single setting of "ip
              address/subnet mask/gateway address ",<br>
                    The ipmid will cache the user setting, and wait for
              "set complete"(<span>"set in progress" parameter value is
                0x0).</span>             When ipmid receives "set
              complete", it will apply this user setting and the other
              two reserved settings fetched   from dbus(netman.py).<br>
                  a. If ipmitool don't send "set complete"
              automatically, user can send raw command to send it.<br>
                  b. We also can send "set complete" in the
              implementation of "set channel access" command mentioned
              by Tom.<br>
              So it will looks like that single setting will be applied
              right away.<br>
              <br>
              (2)If user want to change two or three settings at the
              same time:<br>
                   a. If the "set complete" don't be sent automatically
              by ipmitool( some version ).<br>
                       The user can send settings one by one, and then
              use a raw command(set complete) to apply them.<br>
                       It will works when running from local shell
              (accessing it from serial port) or remote interface.<br>
                   b. If the "set complete" is sent automatically by
              ipmitool.<br>
                       So the single change will be applied immediately,
              the user can operate from a local interface.<br>
              <br>
              Please correct me!<br>
              Thanks!<br>
              <br>
              <br>
              <div style="color:rgb(0,0,0)">
                <div>
                  <hr tabindex="-1" style="display:inline-block;
                    width:98%">
                  <div id="x_divRplyFwdMsg" dir="ltr"><font
                      style="font-size:11pt" face="Calibri, sans-serif"
                      color="#000000"><b>寄件者:</b> Patrick Williams
                      <a class="moz-txt-link-rfc2396E" href="mailto:patrick@stwcx.xyz">&lt;patrick@stwcx.xyz&gt;</a><br>
                      <b>寄件日期:</b> 2016年10月4日 上午 09:51<br>
                      <b>收件者:</b> tomjose<br>
                      <b>副本:</b> Li Nan; OpenBMC Maillist<br>
                      <b>主旨:</b> Re: IPMI LAN command story design - try
                      3rd send</font>
                    <div> </div>
                  </div>
                </div>
                <font size="2"><span style="font-size:10pt">
                    <div class="PlainText">Forwarding to list.<br>
                      <br>
                      On Tue, Oct 04, 2016 at 03:02:54PM +0530, tomjose
                      wrote:<br>
                      &gt; Hello Nan,<br>
                      &gt; <br>
                      &gt; The current implementation mandates the user
                      to enter &lt;IP <br>
                      &gt; Address&gt;,&lt;NetMask&gt; and
                      &lt;Gateway&gt;<br>
                      &gt; for the network settings to be changed. Even
                      though the user wants to <br>
                      &gt; change only the IP<br>
                      &gt; address , because of the way we have
                      implemented we are forcing the user <br>
                      &gt; to enter all the three details.<br>
                      &gt; <br>
                      &gt; The LAN settings is a property of the
                      channel(Channel 1 typically <br>
                      &gt; corresponds to ETH0) and we can leverage<br>
                      &gt; the "Set Channel Access" command to apply the
                      settings.We can apply the <br>
                      &gt; network settings whenever the<br>
                      &gt; Access Mode is turned on.(ipmitool lan set 1
                      access on)<br>
                      &gt; <br>
                      &gt; With the solution i am thinking , the Set LAN
                      configuration command <br>
                      &gt; would not be used to apply the network<br>
                      &gt; settings but it would be used to cache the
                      network settings and it would <br>
                      &gt; be applied when the Set Channel Access<br>
                      &gt; command is called.<br>
                      &gt; <br>
                      &gt; The following link explains the order of
                      commands.<br>
                      &gt; <br>
                      &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk534825"
href="https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool%28LAN">https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool(LAN</a>
                      <br>
                      &gt; Configuration section)<br>
                      &gt; <br>
                      &gt; Regarding #2 - Authentication Type Support,
                      it seems that this section <br>
                      &gt; is not updated properly.<br>
                      &gt; Get Channel Authentication capabilities is
                      the first command issued for <br>
                      &gt; a session setup.<br>
                      &gt; This command also has the same Authentication
                      type support field and the <br>
                      &gt; 7th bit which<br>
                      &gt; was reserved in #2 is used in this command to
                      specify IPMI2.0 and <br>
                      &gt; IPMI1.5 authentication<br>
                      &gt; capabilities.<br>
                      &gt; <br>
                      &gt; So since #2 is outdated to represent the
                      necessary authentication <br>
                      &gt; capabilities, i think we do<br>
                      &gt; not need to support parameter #2.<br>
                      &gt; <br>
                      &gt; Regarding #3 - Authentication Type Enables -
                      this is needed if we <br>
                      &gt; support different authentication<br>
                      &gt; types for different requested privilege
                      levels. Since the authentication <br>
                      &gt; types are outdated  and we<br>
                      &gt; do not support different authentication types
                      per privilege levels, we <br>
                      &gt; can avoid this parameter.<br>
                      &gt; <br>
                      &gt; Thanks,<br>
                      &gt; Tom<br>
                      &gt; <br>
                      &gt; <br>
                      &gt; <br>
                      &gt; <br>
                      &gt; On Monday 03 October 2016 07:29 PM, Li Nan
                      wrote:<br>
                      &gt; &gt;<br>
                      &gt; &gt; Hi team,<br>
                      &gt; &gt;<br>
                      &gt; &gt; I'm working on the story of Confirm LAN
                      Command meet IPMI 2.0<br>
                      &gt; &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk92767"
                        href="https://github.com/openbmc/openbmc/issues/444">
                        https://github.com/openbmc/openbmc/issues/444</a><br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt; &lt;<a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk951354"
                        href="https://github.com/openbmc/openbmc/issues/444">https://github.com/openbmc/openbmc/issues/444</a>&gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt; I summarize some fields of settings
                      below, and need some help to <br>
                      &gt; &gt; confirm the direction of my work.<br>
                      &gt; &gt;<br>
                      &gt; &gt; ```<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;   1.IPMI LAN command status and work
                      plan<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.1.Current status<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPMI LAN command consists of 4 command (
                      refer to IPMI 2.0 Spec, <br>
                      &gt; &gt; Chapter 23 ):Set LAN Configuration
                      Parameters, Get LAN Configuration <br>
                      &gt; &gt; Parameters, Suspend BMC ARPs and Get
                      IP/UDP/RMCP Statistics.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Existing code includes implementation of
                      Set/Get LAN configuration <br>
                      &gt; &gt; Parameters. ( Refer to <br>
                      &gt; &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk167726"
href="https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp">https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp</a>
                      <div
                        id="LPBorder_GT_14766818700840.05824222564837944"
                        style="margin-bottom:20px; overflow:auto;
                        width:100%; text-indent:0px">
                        <table
                          id="LPContainer_14766818700750.04617596189747686"
                          style="width:90%;
                          background-color:rgb(255,255,255);
                          overflow:auto; padding-top:20px;
                          padding-bottom:20px; margin-top:20px;
                          border-top:1px dotted rgb(200,200,200);
                          border-bottom:1px dotted rgb(200,200,200)"
                          cellspacing="0">
                          <tbody>
                            <tr style="border-spacing:0px" valign="top">
                              <td colspan="1"
                                id="ImageCell_14766818700770.22403254259142635"
                                style="width:250px; display:table-cell;
                                padding-right:20px">
                                <div
                                  id="LPImageContainer_14766818700770.18778244300042013"
                                  style="background-color:rgb(255,255,255);
                                  height:250px; margin:auto;
                                  display:table; width:250px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp"
id="LPImageAnchor_14766818700780.03597320227273715"
                                    style="display:table-cell;
                                    text-align:center"><img
                                      moz-do-not-send="true"
                                      id="LPThumbnailImageID_14766818700790.5823514274096728"
                                      style="display:inline-block;
                                      max-width:250px; max-height:250px;
                                      height:250px; width:250px;
                                      border-width:0px;
                                      vertical-align:bottom"
src="imap://tomjose@imap.linux.ibm.com:993/fetch%3EUID%3E.Drafts%3E21?v=3&amp;s=400"
                                      height="250" width="250"></a></div>
                              </td>
                              <td colspan="2"
                                id="TextCell_14766818700810.2512003816386229"
                                style="vertical-align: top; padding:
                                0px; display: table-cell; position:
                                relative;">
                                <div
                                  id="LPTitle_14766818700810.02701722095618142"
                                  style="top:0px; color:rgb(0,120,215);
                                  font-weight:400; font-size:21px;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  line-height:21px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-host-ipmid/blob/master/transporthandler.cpp"
id="LPUrlAnchor_14766818700820.3482927685581906"
                                    style="text-decoration:none">openbmc/phosphor-host-ipmid</a></div>
                                <div
                                  id="LPMetadata_14766818700830.7014328133428414"
                                  style="margin:10px 0px 16px;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:14px">
                                  github.com</div>
                                <div
                                  id="LPDescription_14766818700830.8547523260280545"
                                  style="display:block;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:20px;
                                  max-height:100px; overflow:hidden">
                                  phosphor-host-ipmid - dbus-based ipmid
                                  for host-endpoint IPMI commands</div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <br>
                      &gt; &gt; )<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.2.IPMI LAN Command Handling<br>
                      &gt; &gt;<br>
                      &gt; &gt; Example for Set LAN Configuration
                      Parameters.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Parameter<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; #<br>
                      &gt; &gt;<br>
                      &gt; &gt; Number<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; IPMI handling<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; dbus method<br>
                      &gt; &gt;<br>
                      &gt; &gt; Set In Progress(Volatile)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 0<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      phosphor-host-ipmid/transporthandler.cpp, Line
                      209.<br>
                      &gt; &gt;<br>
                      &gt; &gt; variable lan_set_in_progress act as a
                      statemachine.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No need.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication Type Support(Read Only)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      phosphor-host-ipmid/transporthandler.cpp, Line
                      305.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Setto 0x4 (MD5)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No need.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication Type<br>
                      &gt; &gt;<br>
                      &gt; &gt; Enables<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      phosphor-host-ipmid/transporthandler.cpp, Line
                      311.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Set to 0x4, 0x4, 0x4, 0x4, 0x4.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No need.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 3<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      phosphor-host-ipmid/transporthandler.cpp, Line
                      169.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; phosphor-neworkd/netman.py: Line 266:
                      SetAddress4<br>
                      &gt; &gt;<br>
                      &gt; &gt; MAC Address<br>
                      &gt; &gt;<br>
                      &gt; &gt; (can be Read Only)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 5<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      phosphor-host-ipmid/transporthandler.cpp, Line
                      174.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; phosphor-neworkd/netman.py: Line 334:
                      SetHwAddress.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Subnet Mask<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 6<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      phosphor-host-ipmid/transporthandler.cpp, Line
                      199.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; phosphor-neworkd/netman.py: Line 266:
                      SetAddress4<br>
                      &gt; &gt;<br>
                      &gt; &gt; Default Gateway Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 12<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      phosphor-host-ipmid/transporthandler.cpp, Line
                      204.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; phosphor-neworkd/netman.py: Line 266:
                      SetAddress4<br>
                      &gt; &gt;<br>
                      &gt; &gt; Handling of Get LAN Configuration
                      Parameters command is similar to Set <br>
                      &gt; &gt; LAN Configuration Parameters. Refer to <br>
                      &gt; &gt; phosphor-host-ipmid/transporthandler.cpp
                      and phosphor-networkd/netman.py.<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.3.Gap between current code and
                      IPMI Spec 2.0<br>
                      &gt; &gt;<br>
                      &gt; &gt; LAN Configuration Parameter List<br>
                      &gt; &gt;<br>
                      &gt; &gt; Parameter<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; #<br>
                      &gt; &gt;<br>
                      &gt; &gt; Number<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Parameter Data( non-volatile unless
                      otherwise noted )<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Bit field<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Description<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Current status/Note<br>
                      &gt; &gt;<br>
                      &gt; &gt; ( Yes = current support.<br>
                      &gt; &gt;<br>
                      &gt; &gt; No = not support. )<br>
                      &gt; &gt;<br>
                      &gt; &gt; Set In Progress(Volatile)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 0<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; byte 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 00b -= set complete<br>
                      &gt; &gt;<br>
                      &gt; &gt; 0ab = set in progress<br>
                      &gt; &gt;<br>
                      &gt; &gt; 10b = commit write<br>
                      &gt; &gt;<br>
                      &gt; &gt; 11b = reserved<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Yes<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication Type Support(Read Only)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; byte 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication type(s) enabled for this
                      channel(bi0tfield):<br>
                      &gt; &gt;<br>
                      &gt; &gt; All bits: 1b =supported<br>
                      &gt; &gt;<br>
                      &gt; &gt; 0b= authentication type not available
                      for use.<br>
                      &gt; &gt;<br>
                      &gt; &gt; [5] – OEM proprietary<br>
                      &gt; &gt;<br>
                      &gt; &gt; [4] – straight password / key<br>
                      &gt; &gt;<br>
                      &gt; &gt; [3] – reserved<br>
                      &gt; &gt;<br>
                      &gt; &gt; [2] – MD5<br>
                      &gt; &gt;<br>
                      &gt; &gt; [1] – MD2<br>
                      &gt; &gt;<br>
                      &gt; &gt; [0] - none<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Yes.<br>
                      &gt; &gt;<br>
                      &gt; &gt; MD5<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authenticaton Type<br>
                      &gt; &gt;<br>
                      &gt; &gt; Enables<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; This field is used to configure which
                      Authentication Types are <br>
                      &gt; &gt; available for use when a remote console
                      activates an IPMI messaging <br>
                      &gt; &gt; connection to the BMC for a given
                      requested maximum privilege level.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Yes.<br>
                      &gt; &gt;<br>
                      &gt; &gt; MD5<br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 3<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data 1:4<br>
                      &gt; &gt;<br>
                      &gt; &gt; MS-byte first<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Yes<br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Address Source<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 4<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; address source<br>
                      &gt; &gt;<br>
                      &gt; &gt; 0h – unspecified<br>
                      &gt; &gt;<br>
                      &gt; &gt; 1h = static address (manually
                      configured)<br>
                      &gt; &gt;<br>
                      &gt; &gt; 2h = address obtained by BMC running
                      DHCP<br>
                      &gt; &gt;<br>
                      &gt; &gt; 3h = address loaded by BIOS or system
                      software<br>
                      &gt; &gt;<br>
                      &gt; &gt; 4h = address obtained by BMC running
                      other address assignment protocol<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; MAC Address<br>
                      &gt; &gt;<br>
                      &gt; &gt; (can be Read Only)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 5<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data 1:6<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; MAC Address for messages transmitted
                      from BMC.<br>
                      &gt; &gt;<br>
                      &gt; &gt; MS-byte first.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Yes.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Subnet Mask<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 6<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data1:4<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Yes<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv4 Header Parameter<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 7<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No<br>
                      &gt; &gt;<br>
                      &gt; &gt; Primary RMCP Port Number(optional)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 8<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data1:2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Secondary RMCP Port Number(optional)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 9<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data1:2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; BMC-generated ARP control (optional)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 10<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; data1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Gratuitous ARP interval (optional)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 11<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Default GatewayAddress<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 12<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Yes<br>
                      &gt; &gt;<br>
                      &gt; &gt; Default Gateway MAC Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 13<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Backup Gateway Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 14<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Backup Gateway MAC Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 15<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Community String<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 16<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Number of Destinations( Read Only )<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 17<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Destination Type (volatile /
                      non-volatile – see description )<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 18<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Destination Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 19<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Following parameters are introduced with
                      IPMI v2.0/RMCP+<br>
                      &gt; &gt;<br>
                      &gt; &gt; 802.1q VLAN ID (12-bit)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 20<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; 802.1q VLAN Priority<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 21<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; RMCP+ Messaging Cipher Suite Entry
                      Support( Read Only )<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 22<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; RMCP+ Messaging Cipher Suite Entries(
                      Read Only )<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 23<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; RMCP+ Messaging Cipher Suite Privilege
                      Levels<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 24<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Destination Address VLAN TAGs<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 25<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Bad Password Threshold<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 26<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6/IPv4 Support<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 50<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6/IPv4 Addressing Enables<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 51<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6/IPv4 Header Static Traffic Class<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 52<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Header Static Hop Limit<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 53<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Header Flow Label<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 54<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Status<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 55<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Addresses<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 56<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 DHCPv6 Static DUID storage length<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 57<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 DHCPv6 Static DUIDs<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 58<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Dynamic ( SLAAC/DHCPv6) Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 59<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 DHCPv6 Dynamic DUID storage length<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 60<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 DHCPv6 Dynamic DUIDs<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 61<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 DHCPv6 Timing Configuration Support<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 62<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 DHCPv6 Timing &amp; Configuration<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 63<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Router Address Configuration
                      Control<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 64<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 1 IP Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 65<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 1 MAC Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 66<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 1 Prefix Length<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 67<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 1 Prefix Value<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 68<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 2 Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 69<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 2 MAC Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 70<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 2 Prefix Length<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 71<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Static Router 2 Prefix Value<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 72<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Number of Dynamic Router Info Sets<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 73<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Dynamic Router Info IP Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 74<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Dynamic Router Info MAC Address<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 75<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Dynamic Router Info Prefix Length<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 76<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Dynamic Router Info Prefix Value<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 77<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Dynamic Router Received Hop Limit<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 78<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Neighbor Discovery / SLAAC Timing
                      Configuration Support<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 79<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; IPv6 Neighbor Discovery / SLAAC Timing
                      Configuration<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 80<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt; OEM Parameters<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 192:255<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; No.<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.4.Work Plan<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;       1.4.1.Set LAN Configuration
                      Parameters<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;       1.4.2.Get LAN Configuration
                      Parameters<br>
                      &gt; &gt;<br>
                      &gt; &gt; I figure out what we support in
                      phosphor-netwokd repo ( Refer to:<br>
                      &gt; &gt;<br>
                      &gt; &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk841780"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py">https://github.com/openbmc/phosphor-networkd/blob/master/netman.py</a>
                      ) :
                      <div
                        id="LPBorder_GT_14766819138340.9971102762841955"
                        style="margin-bottom:20px; overflow:auto;
                        width:100%; text-indent:0px">
                        <table
                          id="LPContainer_14766819138300.49168501737801407"
                          style="width:90%;
                          background-color:rgb(255,255,255);
                          overflow:auto; padding-top:20px;
                          padding-bottom:20px; margin-top:20px;
                          border-top:1px dotted rgb(200,200,200);
                          border-bottom:1px dotted rgb(200,200,200)"
                          cellspacing="0">
                          <tbody>
                            <tr style="border-spacing:0px" valign="top">
                              <td colspan="1"
                                id="ImageCell_14766819138310.9478808330593138"
                                style="width:250px; display:table-cell;
                                padding-right:20px">
                                <div
                                  id="LPImageContainer_14766819138310.8455049406206201"
                                  style="background-color:rgb(255,255,255);
                                  height:250px; margin:auto;
                                  display:table; width:250px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py"
id="LPImageAnchor_14766819138320.35430488158962925"
                                    style="display:table-cell;
                                    text-align:center"><img
                                      moz-do-not-send="true"
                                      id="LPThumbnailImageID_14766819138320.00471319408841131"
                                      style="display:inline-block;
                                      max-width:250px; max-height:250px;
                                      height:250px; width:250px;
                                      border-width:0px;
                                      vertical-align:bottom"
src="imap://tomjose@imap.linux.ibm.com:993/fetch%3EUID%3E.Drafts%3E21?v=3&amp;s=400"
                                      height="250" width="250"></a></div>
                              </td>
                              <td colspan="2"
                                id="TextCell_14766819138320.898093031037314"
                                style="vertical-align: top; padding:
                                0px; display: table-cell; position:
                                relative;">
                                <div
                                  id="LPTitle_14766819138320.1933719939370082"
                                  style="top:0px; color:rgb(0,120,215);
                                  font-weight:400; font-size:21px;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  line-height:21px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py"
id="LPUrlAnchor_14766819138330.19332660816654357"
                                    style="text-decoration:none">openbmc/phosphor-networkd</a></div>
                                <div
                                  id="LPMetadata_14766819138330.34968770727396603"
                                  style="margin:10px 0px 16px;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:14px">
                                  github.com</div>
                                <div
                                  id="LPDescription_14766819138330.48350723642352855"
                                  style="display:block;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:20px;
                                  max-height:100px; overflow:hidden">
                                  Contribute to phosphor-networkd
                                  development by creating an account on
                                  GitHub.</div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <br>
                      &gt; &gt;<br>
                      &gt; &gt;   * Set In Progress,<br>
                      &gt; &gt;   * Authentication Type Support,<br>
                      &gt; &gt;   * Authentication Type Enables,<br>
                      &gt; &gt;   * IP Address,<br>
                      &gt; &gt;   * MAC Address,<br>
                      &gt; &gt;   * Subnet Mask,<br>
                      &gt; &gt;   * Default Gateway Address<br>
                      &gt; &gt;<br>
                      &gt; &gt; So I think we only support existing
                      configuration.<br>
                      &gt; &gt;<br>
                      &gt; &gt; How can I implement the rest of the
                      configurations/parameters? (open <br>
                      &gt; &gt; issues?)<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;       1.4.3.ARP<br>
                      &gt; &gt;<br>
                      &gt; &gt; Not implemented in Tom’s IPMI network
                      story.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Should I refer to <br>
                      &gt; &gt;
openbmc/import-layers/meta-openembedded/meta-networking/recipes-support/arptables<br>
                      &gt; &gt; ?<br>
                      &gt; &gt;<br>
                      &gt; &gt; Optional command. Not to implement?<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;       1.4.4.IP/UDP/RMCP statistics<br>
                      &gt; &gt;<br>
                      &gt; &gt; Seems like it was not implemented in
                      obmc stories too.<br>
                      &gt; &gt;<br>
                      &gt; &gt; This is an optional command. Not to
                      implement?<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;   2.IPMI LAN Commands in IPMI Spec 2.0
                      -- Format<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.1.Set LAN Configuration Parameters
                      command<br>
                      &gt; &gt;<br>
                      &gt; &gt; Set LAN Configuration Parameters command<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Byte<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Bit field<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Description<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Support<br>
                      &gt; &gt;<br>
                      &gt; &gt; Request Data<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:4]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; reserved<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [3:0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Channel number<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Parameter selector<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 3:N<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Configuration parameter data<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Response Data<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Completion code<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 80h = parameter not supported.<br>
                      &gt; &gt;<br>
                      &gt; &gt; 81h = attempt to set the ‘set in
                      progress’ value (in parameter #0) <br>
                      &gt; &gt; when not in the ‘set complete’ state.
                      (This completion code provides a <br>
                      &gt; &gt; way to recognize that another party has
                      already ‘claimed’ the parameters)<br>
                      &gt; &gt;<br>
                      &gt; &gt; 82h = attempt to write read-only
                      parameter<br>
                      &gt; &gt;<br>
                      &gt; &gt; 83h = attempt to read write-only
                      parameter<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Existing code supports 7 LAN command:<br>
                      &gt; &gt;<br>
                      &gt; &gt; Set In Progress,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication Type Support,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication Type Enables,<br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Address,<br>
                      &gt; &gt;<br>
                      &gt; &gt; MAC Address,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Subnet Mask,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Default Gateway Address.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Refer to:<br>
                      &gt; &gt;<br>
                      &gt; &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk744383"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py">https://github.com/openbmc/phosphor-networkd/blob/master/netman.py</a>
                      <div
                        id="LPBorder_GT_14766819135190.6239112483099216"
                        style="margin-bottom:20px; overflow:auto;
                        width:100%; text-indent:0px">
                        <table
                          id="LPContainer_14766819135120.08389837769896258"
                          style="width:90%;
                          background-color:rgb(255,255,255);
                          overflow:auto; padding-top:20px;
                          padding-bottom:20px; margin-top:20px;
                          border-top:1px dotted rgb(200,200,200);
                          border-bottom:1px dotted rgb(200,200,200)"
                          cellspacing="0">
                          <tbody>
                            <tr style="border-spacing:0px" valign="top">
                              <td colspan="1"
                                id="ImageCell_14766819135140.6500910262786991"
                                style="width:250px; display:table-cell;
                                padding-right:20px">
                                <div
                                  id="LPImageContainer_14766819135140.9650201116072317"
                                  style="background-color:rgb(255,255,255);
                                  height:250px; margin:auto;
                                  display:table; width:250px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py"
id="LPImageAnchor_14766819135160.6062355250061481"
                                    style="display:table-cell;
                                    text-align:center"><img
                                      moz-do-not-send="true"
                                      id="LPThumbnailImageID_14766819135160.20224388578162777"
                                      style="display:inline-block;
                                      max-width:250px; max-height:250px;
                                      height:250px; width:250px;
                                      border-width:0px;
                                      vertical-align:bottom"
src="imap://tomjose@imap.linux.ibm.com:993/fetch%3EUID%3E.Drafts%3E21?v=3&amp;s=400"
                                      height="250" width="250"></a></div>
                              </td>
                              <td colspan="2"
                                id="TextCell_14766819135170.7569986700643088"
                                style="vertical-align: top; padding:
                                0px; display: table-cell; position:
                                relative;">
                                <div
                                  id="LPTitle_14766819135170.7474263517441381"
                                  style="top:0px; color:rgb(0,120,215);
                                  font-weight:400; font-size:21px;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  line-height:21px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py"
id="LPUrlAnchor_14766819135180.6969831556499485"
                                    style="text-decoration:none">openbmc/phosphor-networkd</a></div>
                                <div
                                  id="LPMetadata_14766819135180.8794501172291314"
                                  style="margin:10px 0px 16px;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:14px">
                                  github.com</div>
                                <div
                                  id="LPDescription_14766819135190.7176377054560807"
                                  style="display:block;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:20px;
                                  max-height:100px; overflow:hidden">
                                  Contribute to phosphor-networkd
                                  development by creating an account on
                                  GitHub.</div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.2.Get LAN Configuration Parameters
                      Command<br>
                      &gt; &gt;<br>
                      &gt; &gt; Get LAN Configuration Parameters Command<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Byte<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Bit field<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Description<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Support<br>
                      &gt; &gt;<br>
                      &gt; &gt; Request Data<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 0b = get parameter<br>
                      &gt; &gt;<br>
                      &gt; &gt; 1b = get parameter revision only<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [6:4]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; reserved<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [3:0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Channel number<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Parameter selector<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 3<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Set Selector. Selects a given set of
                      parameters under a given <br>
                      &gt; &gt; Parameter selector value.<br>
                      &gt; &gt;<br>
                      &gt; &gt; 00h if parameter don’t use a Set
                      Selector.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 4<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Block Selector (00h if parameter does
                      not require a block number)<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Response Data<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Completion Code.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Generic codes, plus following
                      command-specific completion code(s):<br>
                      &gt; &gt;<br>
                      &gt; &gt; 80h = parameter not supported.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Existing code supports 7 LAN command:<br>
                      &gt; &gt;<br>
                      &gt; &gt; Set In Progress,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication Type Support,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Authentication Type Enables,<br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Address,<br>
                      &gt; &gt;<br>
                      &gt; &gt; MAC Address,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Subnet Mask,<br>
                      &gt; &gt;<br>
                      &gt; &gt; Default Gateway Address.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Refer to <br>
                      &gt; &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk958940"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py">https://github.com/openbmc/phosphor-networkd/blob/master/netman.py</a>
                      <div
                        id="LPBorder_GT_14766819147140.6668788369201359"
                        style="margin-bottom:20px; overflow:auto;
                        width:100%; text-indent:0px">
                        <table
                          id="LPContainer_14766819147100.8097039239314443"
                          style="width:90%;
                          background-color:rgb(255,255,255);
                          overflow:auto; padding-top:20px;
                          padding-bottom:20px; margin-top:20px;
                          border-top:1px dotted rgb(200,200,200);
                          border-bottom:1px dotted rgb(200,200,200)"
                          cellspacing="0">
                          <tbody>
                            <tr style="border-spacing:0px" valign="top">
                              <td colspan="1"
                                id="ImageCell_14766819147110.0495730902037691"
                                style="width:250px; display:table-cell;
                                padding-right:20px">
                                <div
                                  id="LPImageContainer_14766819147110.5637199434999036"
                                  style="background-color:rgb(255,255,255);
                                  height:250px; margin:auto;
                                  display:table; width:250px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py"
id="LPImageAnchor_14766819147120.30565978863141496"
                                    style="display:table-cell;
                                    text-align:center"><img
                                      moz-do-not-send="true"
                                      id="LPThumbnailImageID_14766819147120.6082135988960494"
                                      style="display:inline-block;
                                      max-width:250px; max-height:250px;
                                      height:250px; width:250px;
                                      border-width:0px;
                                      vertical-align:bottom"
src="imap://tomjose@imap.linux.ibm.com:993/fetch%3EUID%3E.Drafts%3E21?v=3&amp;s=400"
                                      height="250" width="250"></a></div>
                              </td>
                              <td colspan="2"
                                id="TextCell_14766819147120.19826267871748815"
                                style="vertical-align: top; padding:
                                0px; display: table-cell; position:
                                relative;">
                                <div
                                  id="LPTitle_14766819147120.9875276876214526"
                                  style="top:0px; color:rgb(0,120,215);
                                  font-weight:400; font-size:21px;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  line-height:21px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
href="https://github.com/openbmc/phosphor-networkd/blob/master/netman.py"
id="LPUrlAnchor_14766819147130.28471537318808626"
                                    style="text-decoration:none">openbmc/phosphor-networkd</a></div>
                                <div
                                  id="LPMetadata_14766819147130.9575567594901078"
                                  style="margin:10px 0px 16px;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:14px">
                                  github.com</div>
                                <div
                                  id="LPDescription_14766819147140.9548671389913977"
                                  style="display:block;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:20px;
                                  max-height:100px; overflow:hidden">
                                  Contribute to phosphor-networkd
                                  development by creating an account on
                                  GitHub.</div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Parameter revision.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Format: MSN = present revision. LSN =
                      oldest revision parameter is <br>
                      &gt; &gt; backward compatible with. 11h for
                      parameters in this specification.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; The following data bytes are not
                      returned when the ‘get parameter <br>
                      &gt; &gt; revision only’ bit is 1b.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 3:N<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Configuration parameter data.<br>
                      &gt; &gt;<br>
                      &gt; &gt; If the rollback feature is implemented,
                      the BMC makes a copy of the <br>
                      &gt; &gt; existing parameters when the ‘set in
                      progress’ state becomes asserted <br>
                      &gt; &gt; (See the Set in Progress parameter #0).
                      While the ‘set in progress’ <br>
                      &gt; &gt; state is active, the BMC will return
                      data from this copy of the <br>
                      &gt; &gt; parameters, plus any uncommitted changes
                      that were made to data. <br>
                      &gt; &gt; Otherwise, the BMC returns parameter
                      data from non-volatile storage.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;       1.2.1.DHCPv6 Timing Parameters<br>
                      &gt; &gt;<br>
                      &gt; &gt; Not support.<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;       1.2.2.Neighbor discovery / SLAAC
                      Timing Parameters<br>
                      &gt; &gt;<br>
                      &gt; &gt; Not support.<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.3.Suspend BMC ARPs command<br>
                      &gt; &gt;<br>
                      &gt; &gt; Suspend BMC ARPs Command<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Byte<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Bit field<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Description<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Support<br>
                      &gt; &gt;<br>
                      &gt; &gt; Request<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:4]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Reserved<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [3:0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Channel number<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:2]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Reserved<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [1]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; ARP response suspend.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Gratuitous ARP suspend<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Respond<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Completion code<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Do not support.<br>
                      &gt; &gt;<br>
                      &gt; &gt; ( Should refer to<br>
                      &gt; &gt;<br>
                      &gt; &gt;
openbmc/import-layers/meta-openembedded/meta-networking/recipes-support/arptables?<br>
                      &gt; &gt; )<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; present state o f ARP suspension<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:2]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; reserve<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [1]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Address Resolution Protocol.<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;     1.4.Get IP/UDP/RMCP Statistics
                      Command<br>
                      &gt; &gt;<br>
                      &gt; &gt; Get IP/UDP/RMCP Statistics Command<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Byte<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Bit field<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Description<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Support<br>
                      &gt; &gt;<br>
                      &gt; &gt; Request Data<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:4]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; reserved<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [3:0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Channel number<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [7:1]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; clear statistics<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; [0]<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Respond Data<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 1<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Completion Code<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; RMCP is implemented in openbmc.<br>
                      &gt; &gt;<br>
                      &gt; &gt; Refer to<br>
                      &gt; &gt;<br>
                      &gt; &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk583796"
                        href="https://github.com/openbmc/openbmc/issues/432">
                        https://github.com/openbmc/openbmc/issues/432</a>
                      and so on.
                      <div
                        id="LPBorder_GT_14766819296010.08766393403426853"
                        style="margin-bottom:20px; overflow:auto;
                        width:100%; text-indent:0px">
                        <table
                          id="LPContainer_14766819295980.7597078110033914"
                          style="width:90%;
                          background-color:rgb(255,255,255);
                          overflow:auto; padding-top:20px;
                          padding-bottom:20px; margin-top:20px;
                          border-top:1px dotted rgb(200,200,200);
                          border-bottom:1px dotted rgb(200,200,200)"
                          cellspacing="0">
                          <tbody>
                            <tr style="border-spacing:0px" valign="top">
                              <td colspan="1"
                                id="ImageCell_14766819295980.41917779631970675"
                                style="width:250px; display:table-cell;
                                padding-right:20px">
                                <div
                                  id="LPImageContainer_14766819295980.7600807129623182"
                                  style="background-color:rgb(255,255,255);
                                  height:250px; margin:auto;
                                  display:table; width:250px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
                                    href="https://github.com/openbmc/openbmc/issues/432"
id="LPImageAnchor_14766819295990.6128558181951922"
                                    style="display:table-cell;
                                    text-align:center"><img
                                      moz-do-not-send="true"
                                      id="LPThumbnailImageID_14766819295990.4969585489793553"
                                      style="display:inline-block;
                                      max-width:250px; max-height:250px;
                                      height:250px; width:250px;
                                      border-width:0px;
                                      vertical-align:bottom"
src="imap://tomjose@imap.linux.ibm.com:993/fetch%3EUID%3E.Drafts%3E21?v=3&amp;s=400"
                                      height="250" width="250"></a></div>
                              </td>
                              <td colspan="2"
                                id="TextCell_14766819295990.6756862189963907"
                                style="vertical-align: top; padding:
                                0px; display: table-cell; position:
                                relative;">
                                <div
                                  id="LPTitle_14766819295990.8550862643091643"
                                  style="top:0px; color:rgb(0,120,215);
                                  font-weight:400; font-size:21px;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  line-height:21px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
                                    href="https://github.com/openbmc/openbmc/issues/432"
id="LPUrlAnchor_14766819296000.716335010636254"
                                    style="text-decoration:none">Attaching
                                    RMCP session to SOL. · Issue #432 ·
                                    openbmc/openbmc</a></div>
                                <div
                                  id="LPMetadata_14766819296000.4360842965316961"
                                  style="margin:10px 0px 16px;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:14px">
                                  github.com</div>
                                <div
                                  id="LPDescription_14766819296000.23569221320232991"
                                  style="display:block;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:20px;
                                  max-height:100px; overflow:hidden">
                                  openbmc - OpenBMC Distribution</div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Discussed with Tom, these statistics is
                      not implemented in <br>
                      &gt; &gt; phosphor-networkd.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 2:3<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Packets Received.<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 4:5<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Received IP Header Errors<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 6:7<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Received IP Address Errors<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 8:9<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Fragmented IP Packets Received<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 10:11<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; IP Packets Transmitted<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 12:13<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; UDP Packets Received<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 14:15<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; Valid RMCP Received<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 16:17<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; UDP Proxy Packets Received<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; 18:19<br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt;      <br>
                      &gt; &gt;<br>
                      &gt; &gt; UDP Proxy Packets dropped<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;   3.End<br>
                      &gt; &gt;<br>
                      &gt; &gt; ```<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;<br>
                      &gt; &gt;
                      _______________________________________________<br>
                      &gt; &gt; openbmc mailing list<br>
                      &gt; &gt; <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
                      &gt; &gt; <a moz-do-not-send="true"
                        previewremoved="true" id="LPlnk28027"
                        href="https://lists.ozlabs.org/listinfo/openbmc">
                        https://lists.ozlabs.org/listinfo/openbmc</a>
                      <div
                        id="LPBorder_GT_14766819287120.6266425907266072"
                        style="margin-bottom:20px; overflow:auto;
                        width:100%; text-indent:0px">
                        <table
                          id="LPContainer_14766819287090.6607366742832055"
                          style="width:90%;
                          background-color:rgb(255,255,255);
                          overflow:auto; padding-top:20px;
                          padding-bottom:20px; margin-top:20px;
                          border-top:1px dotted rgb(200,200,200);
                          border-bottom:1px dotted rgb(200,200,200)"
                          cellspacing="0">
                          <tbody>
                            <tr style="border-spacing:0px" valign="top">
                              <td colspan="2"
                                id="TextCell_14766819287100.7675997449482372"
                                style="vertical-align: top; padding:
                                0px; display: table-cell; position:
                                relative;">
                                <div
                                  id="LPTitle_14766819287100.7339780245568891"
                                  style="top:0px; color:rgb(0,120,215);
                                  font-weight:400; font-size:21px;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  line-height:21px">
                                  <a moz-do-not-send="true"
                                    target="_blank"
                                    href="https://lists.ozlabs.org/listinfo/openbmc"
id="LPUrlAnchor_14766819287110.19315001819689293"
                                    style="text-decoration:none">openbmc
                                    Info Page - OzLabs</a></div>
                                <div
                                  id="LPMetadata_14766819287110.39149908406025946"
                                  style="margin:10px 0px 16px;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:14px">
                                  lists.ozlabs.org</div>
                                <div
                                  id="LPDescription_14766819287110.12085490578539615"
                                  style="display:block;
                                  color:rgb(102,102,102);
                                  font-weight:400;
                                  font-family:&quot;Microsoft JHengHei
                                  UI&quot;,&quot;Microsoft
                                  JHengHei&quot;,&quot;微軟正黑體&quot;,MingLiU,&quot;細明體&quot;,sans-serif;
                                  font-size:14px; line-height:20px;
                                  max-height:100px; overflow:hidden">
                                  To see the collection of prior
                                  postings to the list, visit the
                                  openbmc Archives. Using openbmc: To
                                  post a message to all the list
                                  members, send email ...</div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <br>
                      &gt; <br>
                      <br>
                      -- <br>
                      Patrick Williams<br>
                    </div>
                  </span></font><br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020106080907000409010108--
