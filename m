Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCmF15p8FzDvLZ
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 21:45:57 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA8AjV6H011536
 for <openbmc@lists.ozlabs.org>; Tue, 8 Nov 2016 05:45:55 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26kbjy6hy1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 05:45:55 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 8 Nov 2016 03:45:53 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 Nov 2016 03:45:50 -0700
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id B215519D8026;
 Tue,  8 Nov 2016 03:45:13 -0700 (MST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA8AjnqD16056822; Tue, 8 Nov 2016 10:45:49 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C333BAE04E;
 Tue,  8 Nov 2016 05:45:49 -0500 (EST)
Received: from [9.193.119.244] (unknown [9.193.119.244])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id A6437AE034;
 Tue,  8 Nov 2016 05:45:48 -0500 (EST)
Subject: Re: IPMI LAN command story design - try 3rd send
To: Patrick Williams <patrick@stwcx.xyz>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
Cc: Li Nan <william.bjlinan@hotmail.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Tue, 8 Nov 2016 16:15:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20161107035006.GB15757@heinlein.lan>
Content-Type: multipart/alternative;
 boundary="------------040208050901040902080808"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16110810-0028-0000-0000-000005F8DEEC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006041; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00778118; UDB=6.00374712; IPR=6.00555441; 
 BA=6.00004862; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013251; XFM=3.00000011;
 UTC=2016-11-08 10:45:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16110810-0029-0000-0000-000030A7EE79
Message-Id: <5821ACDB.5040607@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-08_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611080196
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
X-List-Received-Date: Tue, 08 Nov 2016 10:45:58 -0000

This is a multi-part message in MIME format.
--------------040208050901040902080808
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Patrick,

I had a discussion with xCAT team member regarding set LAN command.

xCAT does the LAN configuration from the host OS only. xCAT data to 
manage a cluster is
stored in a relational database. The xCAT tables need to be updated for 
the cluster and
nodes are rebooted into the genesis image and the following standard 
script is run.
xCAT has no usecase to run out-of-band set lan configuration commands.

  https://github.com/xcat2/xcat-core/blob/master/xCAT-genesis-scripts/bin/bmcsetup#L285

In the script the following commands are executed if the IP 
configuration is static.

/ipmitool lan set 1 ipaddr x.x.x.x//
//ipmitool lan set 1 netmask x.x.x.x//
//ipmitool lan set 1 defgw ipaddr x.x.x.x/

After the above IP settings are applied, there is a step in the script, 
which expects
that the ip settings are applied after 30 sec on OpenPower boxes and 
eventually does a
bmc reset.

/# After network commands are issued, pause to allow the BMC to apply 
(OpenPower)//
//snooze/
.
.
.
/# Cold reset the BMC//
//cold_reset_bmc/

 From this it looks like the implementation done on Barreleye would work 
straight with xCAT implementation.

The script has Open Power specific code as well to define specific 
behavior. For example cold_reset_bmc
has code specifically for OpenPower AMI boxes, there is code for OEM 
commands as well.

Since we need similar set of lan configuration commands for net-ipmid 
and host-ipmid. In the case we
support Set Channel Access or an OEM command to trigger applying the ip 
changes. It would mean we
modify the xCAT bmcsetup script.

Regards,
Tom


On Monday 07 November 2016 09:20 AM, Patrick Williams wrote:
> Tom,
>
> Thanks for the explanation.  With this website you pointed to and some
> other investigation I've done, I am comfortable with us using the 'Set
> Channel Access' as the time to apply the settings.  The documentation of
> two competition products both seem to require an 'ipmitool mc reset
> warm' for IP address changes to take effect, so we are at least better
> than that.
>
> Can you internally track down a contact on the xCAT team and verify that
> this will be ok with them?  xCAT is an open source management tool that
> uses IPMI for most of the system management and we should understand
> what process they use for applying IP address changes.  If they expect
> to do a sequence of set-lan command and then a reset, then our
> implementation using 'Set Channel Access' won't cover their cases
> either.
>
> On Fri, Nov 04, 2016 at 11:20:25PM +0530, tomjose wrote:
>> Hi Patrick,
>>
>> In the IPMI command flow that Nan mentioned in the earlier mail. Any of
>> the following ipmitool command for
>> setting the IPv4 configuration, one of the step is to 'Commit
>> Write'(Step 8 in Nan's mail).
>>
>> ipmitool lan set 1 ipaddr x.x.x.x
>> ipmitool lan set 1 netmask x.x.x.x
>> ipmitool lan set 1 defgw ipaddr x.x.x.x
>>
>> As part of the execution of any of the above commands a commit write is
>> executed. In that case we cannot use
>> 'Commit Write' as a way to denote the completion of a transaction.
>>
>> The IPMI specification expects the IP configuration parameters as
>> non-volatile parameters. The commit write
>> parameter is a way to implement rollback feature. The BMC would make a
>> copy of the existing parameters
>> when the 'Set in Progress' state is asserted.
>>
>> The Get/Set LAN Configuration commands do not provide an option to apply
>> the configuration and is identified as
>> LAN channel settings. The link below used 'Set Channel Access' command
>> to apply the settings.
>> (ipmitool lan set 1 access on). Since LAN configuration parameters are
>> channel settings, we thought of
>> applying the LAN configuration parameters as part of 'Set Channel
>> Access'. I am okie if we have
>> an OEM command to trigger applying the LAN settings.
>>
>> https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool
>>
>> In Barreleye we did not implement the 'Set Channel Access' command.
>> There was no external
>> command to trigger apply the settings. In Barreleye the LAN settings are
>> applied when all the
>> three entries(IP Address, Netmask and Gateway address) where set. So
>> only to change the
>> IP address, the netmask and gateway address need to be re-entered, which
>> was an imperfect
>> solution.
>>
>> Regards,
>> Tom
>>
>>
>>
>> On Friday 04 November 2016 07:44 PM, Patrick Williams wrote:
>>> Tom,
>>>
>>> On Fri, Nov 04, 2016 at 06:56:21PM +0530, tomjose wrote:
>>>> The Set Channel access command was decided to be used to mark the end of
>>>> a setting LAN configuration transaction.
>>> The IPMI spec for the SetLanConfig has a parameter 'Set In Progress'
>>> which states: 10b = commit write.  Why are we not utilizing that?  Maybe
>>> in addition to Set Channel Access?
>>>
>>> I don't see anything in the Set Channel Access command description that
>>> would be obvious as a mechanism for updating IP addresses.  Was that
>>> just quick behavior we decided to do for Barreleye?  Is there any reason
>>> why we would not deprecate that behavior in favor of the Set In
>>> Progress / commit write?
>>>


--------------040208050901040902080808
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Patrick,<br>
    <br>
    I had a discussion with xCAT team member regarding set LAN command.<br>
    <br>
    xCAT does the LAN configuration from the host OS only. xCAT data to
    manage a cluster is<br>
    stored in a relational database. The xCAT tables need to be updated
    for the cluster and<br>
    nodes are rebooted into the genesis image and the following standard
    script is run.<br>
    xCAT has no usecase to run out-of-band set lan configuration
    commands.<br>
    <br>
 <a class="moz-txt-link-freetext" href="https://github.com/xcat2/xcat-core/blob/master/xCAT-genesis-scripts/bin/bmcsetup#L285">https://github.com/xcat2/xcat-core/blob/master/xCAT-genesis-scripts/bin/bmcsetup#L285</a><br>
    <br>
    In the script the following commands are executed if the IP
    configuration is static.<br>
    <br>
    <i>ipmitool lan set 1 ipaddr x.x.x.x</i><i><br>
    </i><i>ipmitool lan set 1 netmask x.x.x.x</i><i><br>
    </i><i>ipmitool lan set 1 defgw ipaddr x.x.x.x</i><br>
    <br>
    After the above IP settings are applied, there is a step in the
    script, which expects<br>
    that the ip settings are applied after 30 sec on OpenPower boxes and
    eventually does a<br>
    bmc reset.<br>
    <br>
    <i># After network commands are issued, pause to allow the BMC to
      apply (OpenPower)</i><i><br>
    </i><i>snooze</i><br>
    .<br>
    .<br>
    .<br>
    <i># Cold reset the BMC</i><i><br>
    </i><i>cold_reset_bmc</i><br>
    <br>
    From this it looks like the implementation done on Barreleye would
    work straight with xCAT implementation.<br>
    <br>
    The script has Open Power specific code as well to define specific
    behavior. For example cold_reset_bmc<br>
    has code specifically for OpenPower AMI boxes, there is code for OEM
    commands as well.<br>
    <br>
    Since we need similar set of lan configuration commands for
    net-ipmid and host-ipmid. In the case we<br>
    support Set Channel Access or an OEM command to trigger applying the
    ip changes. It would mean we <br>
    modify the xCAT bmcsetup script.<br>
    <br>
    Regards,<br>
    Tom<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On Monday 07 November 2016 09:20 AM,
      Patrick Williams wrote:<br>
    </div>
    <blockquote cite="mid:20161107035006.GB15757@heinlein.lan"
      type="cite">
      <pre wrap="">Tom,

Thanks for the explanation.  With this website you pointed to and some
other investigation I've done, I am comfortable with us using the 'Set
Channel Access' as the time to apply the settings.  The documentation of
two competition products both seem to require an 'ipmitool mc reset
warm' for IP address changes to take effect, so we are at least better
than that.

Can you internally track down a contact on the xCAT team and verify that
this will be ok with them?  xCAT is an open source management tool that
uses IPMI for most of the system management and we should understand
what process they use for applying IP address changes.  If they expect
to do a sequence of set-lan command and then a reset, then our
implementation using 'Set Channel Access' won't cover their cases
either.

On Fri, Nov 04, 2016 at 11:20:25PM +0530, tomjose wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi Patrick,

In the IPMI command flow that Nan mentioned in the earlier mail. Any of 
the following ipmitool command for
setting the IPv4 configuration, one of the step is to 'Commit 
Write'(Step 8 in Nan's mail).

ipmitool lan set 1 ipaddr x.x.x.x
ipmitool lan set 1 netmask x.x.x.x
ipmitool lan set 1 defgw ipaddr x.x.x.x

As part of the execution of any of the above commands a commit write is 
executed. In that case we cannot use
'Commit Write' as a way to denote the completion of a transaction.

The IPMI specification expects the IP configuration parameters as 
non-volatile parameters. The commit write
parameter is a way to implement rollback feature. The BMC would make a 
copy of the existing parameters
when the 'Set in Progress' state is asserted.

The Get/Set LAN Configuration commands do not provide an option to apply 
the configuration and is identified as
LAN channel settings. The link below used 'Set Channel Access' command 
to apply the settings.
(ipmitool lan set 1 access on). Since LAN configuration parameters are 
channel settings, we thought of
applying the LAN configuration parameters as part of 'Set Channel 
Access'. I am okie if we have
an OEM command to trigger applying the LAN settings.

<a class="moz-txt-link-freetext" href="https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool">https://www.thomas-krenn.com/en/wiki/Configuring_IPMI_under_Linux_using_ipmitool</a>

In Barreleye we did not implement the 'Set Channel Access' command. 
There was no external
command to trigger apply the settings. In Barreleye the LAN settings are 
applied when all the
three entries(IP Address, Netmask and Gateway address) where set. So 
only to change the
IP address, the netmask and gateway address need to be re-entered, which 
was an imperfect
solution.

Regards,
Tom



On Friday 04 November 2016 07:44 PM, Patrick Williams wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Tom,

On Fri, Nov 04, 2016 at 06:56:21PM +0530, tomjose wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">The Set Channel access command was decided to be used to mark the end of
a setting LAN configuration transaction.
</pre>
          </blockquote>
          <pre wrap="">The IPMI spec for the SetLanConfig has a parameter 'Set In Progress'
which states: 10b = commit write.  Why are we not utilizing that?  Maybe
in addition to Set Channel Access?

I don't see anything in the Set Channel Access command description that
would be obvious as a mechanism for updating IP addresses.  Was that
just quick behavior we decided to do for Barreleye?  Is there any reason
why we would not deprecate that behavior in favor of the Set In
Progress / commit write?

</pre>
        </blockquote>
        <pre wrap="">
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040208050901040902080808--
