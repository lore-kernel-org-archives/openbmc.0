Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z75jT54kCzDqks
 for <openbmc@lists.ozlabs.org>; Fri, 29 Dec 2017 10:37:16 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Dec 2017 15:37:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,472,1508828400"; d="scan'208";a="22203795"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga002.jf.intel.com with ESMTP; 28 Dec 2017 15:37:14 -0800
Date: Thu, 28 Dec 2017 15:37:14 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Michael.E.Brown@dell.com
Cc: stewart@linux.vnet.ibm.com, bradleyb@fuzziesquirrel.com,
 openbmc@lists.ozlabs.org, richard.marian.thomaiyar@linux.intel.com
Subject: Re: OpenBMC community telecon - 11/27 Agenda
Message-ID: <20171228233714.GR113334@mauery>
References: <911ECDC1-D1F4-4B4B-8433-CE396C2EEE35@fuzziesquirrel.com>
 <20171205010205.GH113334@mauery>
 <1513620424.5787.47.camel@fuzziesquirrel.com>
 <20171218223918.GO113334@mauery>
 <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
 <886a66c536b44ed0928e4348022b67ca@ausx13mps334.AMER.DELL.COM>
 <D2105B22-1AB7-4943-A94E-2B5EDE275F7C@fuzziesquirrel.com>
 <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
 <87k1xfvbhh.fsf@linux.vnet.ibm.com>
 <c49e89931ed74295958f09fe6ad3db80@ausx13mps334.AMER.DELL.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c49e89931ed74295958f09fe6ad3db80@ausx13mps334.AMER.DELL.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Dec 2017 23:37:18 -0000

On 22-Dec-2017 05:21 PM, Michael.E.Brown@dell.com wrote:
>We have spent almost two years now writing a comprehensive SELinux policy =
for our product. Our current shipping product has SELinux enabled and in "p=
ermissive" mode for field testing. Our next major release will have SELinux=
 in enforcing mode, barring major issues in testing. We just had outside se=
curity auditors take a look at the implementation and I must say that I'm v=
ery pleased with the outcome.
>
><soapbox mode=3D"on">
>I strongly encourage every embedded project to have a comprehensive SELinu=
x policy, to enable that policy at the earliest possible opportunity during=
 development, and to have a robust solution and development methodology to =
run all daemons as NON-root. My personal experience is that it is extraordi=
narily difficult to retrofit SELinux policy onto a legacy codebase and that=
 it is very difficult to convert an existing codebase running as root to fu=
ll non-root. What tends to happen is that unrelated things get stuffed into=
 the "wrong" places and things break in both spectacular and subtle ways, s=
ometimes at the same time, when you try to do the conversion from root -> n=
oroot and DAC -> MAC. The earlier you make this transition, the easier thin=
gs are, long term.
></soapbox>
>
>My biggest problem right now with openbmc is that everything runs as root =
and there is no selinux. Huge step backwards for me. :)  This is one major =
thing that I would like to help drive in OpenBMC.
>
>If you run all the daemons as different users, that tends to sort out desi=
gn issues.
>
>Now, on to the good stuff I can say: The openbmc design lends itself *real=
ly* well to both non-root and SELinux. Having DBUS as the common interface =
should let us do something like:
>	- phosphor-hwmon runs as "hwmon" user and group. (systemd service file se=
ttings User=3D, Group=3D)
>	- phosphor-hwmon installs systemd-tmpfiles to change file ownership of th=
e sysfs files needed to run hwmon daemons as hwmon user
>	- phosphor-hwmon installs DBUS policy files to allow itself to own the db=
us endpoints
>	- phosphor-hwmon dbus policy files specify a group that can be used to ca=
ll the dbus endpoints (eg. "hwmon_read")
>	- On the other side of this, the thermal daemons run with supplementary g=
roups "hwmon_read" (systemd SupplementaryGroups=3D)
>	- SELinux policy written for phosphor-hwmon that allows it to *only* read=
 hwmon sysfs files, and talk to DBUS.

I fully support your direction with the "run each daemon as its own=20
user" policy. Almost nothing should be running as root anymore. I don't=20
have any SELinux experience, so it is great to have someone in the=20
community that does and is willing to drive that.

Have you considered using user namespaces to avoid username collisions=20
with system users and user-chosen names (like if an IPMI user wanted to=20
pick 'root' as the name)? I have seen people demonstrate how you can use=20
containers to do this, but I have not yet figured out how it all works.

The reason I don't like the NSS mechanism with a single unix user that=20
you proposed is that it allows users to attack each other, which can=20
lead to privilege escalations as well. If the non-system users are=20
namespaced, they can be called whatever they want and have whatever ID=20
they want, but as far as the kernel goes, they are separate users and=20
all non-root.

--Vernon

>--
>Michael
>
>-----Original Message-----
>From: Stewart Smith [mailto:stewart@linux.vnet.ibm.com]
>Sent: Thursday, December 21, 2017 6:43 PM
>To: Brown, Michael E <Michael_E_Brown@Dell.com>; bradleyb@fuzziesquirrel.c=
om
>Cc: vernon.mauery@linux.intel.com; openbmc@lists.ozlabs.org; richard.maria=
n.thomaiyar@linux.intel.com
>Subject: RE: OpenBMC community telecon - 11/27 Agenda
>
>Michael.E.Brown@dell.com writes:
>> The main issue is one of security. And I realize here that openbmc has a=
 different security model than our product, but here goes:
>>
>> The "ipmi/web/etc" users are "attacker controlled", if you consider
>> the end-user the adversary and are trying to protect the internal
>> functioning of the product. That may sound a bit off, but the main
>> thing here is that we don't want to allow the user(/administrator) to
>> do something that would break the product or allow an insecure
>> situation. In our product we now have all of our internal daemons
>> running as non-root and a separate user account for each daemon. For
>> example: the "powerd" daemon runs as the "power" user and "power"
>> group. That linux user has permissions to the /dev entries it needs to
>> function, but does not have access to things like KVM or other
>> infrastructure or hardware that it doesn=E2=80=99t need. Since we allow =
"ssh"
>> logins to a (minimalistic) shell (either racadm or a smash compatible
>> clp), that represents an attack surface. If the user were able to
>> create user called "power" that is a linux user and an ipmi/web user
>> and they logged into the box as that 'power' user, it would be have
>> the same permissions as our power daemon. We try to lock down the
>> default shells for non-privileged users but this would represent a
>> possible entry point.
>
>Neat!
>
>I've thought that OpenBMC would be a good candidate for a really restricti=
ve set of SELinux policy too (or some other security module), to further mi=
tigate any possible damage that could be done even in the event of a vulner=
ability.
>
>Have you looked into anything like that at all?
>
>--
>Stewart Smith
>OPAL Architect, IBM.
>
