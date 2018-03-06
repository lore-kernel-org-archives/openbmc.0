Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwJVy07dJzDwNS
 for <openbmc@lists.ozlabs.org>; Tue,  6 Mar 2018 12:06:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w26145Ia092677
 for <openbmc@lists.ozlabs.org>; Mon, 5 Mar 2018 20:05:58 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ghgb298s6-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Mar 2018 20:05:58 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 5 Mar 2018 20:05:57 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Mar 2018 20:05:53 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2615rLg43057230; Tue, 6 Mar 2018 01:05:53 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 332F0AE03B;
 Mon,  5 Mar 2018 20:07:19 -0500 (EST)
Received: from birb.localdomain (unknown [9.185.142.40])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 7235CAE034;
 Mon,  5 Mar 2018 20:07:18 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id AC2A74EC648; Tue,  6 Mar 2018 12:05:47 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: "Tanous\, Ed" <ed.tanous@intel.com>,
 "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>,
 "Mohit Gupta \(QDT\)" <guptam@qti.qualcomm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Exposing POST codes
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
 <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
Date: Tue, 06 Mar 2018 12:05:47 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 18030601-0056-0000-0000-00000428C376
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008628; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00998950; UDB=6.00508063; IPR=6.00778268; 
 MB=3.00019870; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-06 01:05:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030601-0057-0000-0000-0000086AC793
Message-Id: <87efkyf1xw.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-05_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803060012
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
X-List-Received-Date: Tue, 06 Mar 2018 01:06:02 -0000

"Tanous, Ed" <ed.tanous@intel.com> writes:
> Does POWER have any way of reporting detailed boot progress?  If, for
> example, the USB link training starts processor init flows, is that
> logged in a POWER system?  On x86, it would be logged as a POST code.

On POWER (currently at least) there's a few things in play.

On OpenPOWER systems the only thing we currently actively communicate to
the BMC is the IPMI FW progress sensor, which isn't especially fine
grained, but it's what we have hooked up.

We do print out more detailed progress information to the console
though. What we print out to the console is roughly in two categories:
a) ISTEPs (probably the closest thing we have to POST codes, in that
   they're numbers), but these also have names because text is more
   descriptive than numbers.
b) log messages from OPAL (words, mostly around what we've probed/are
initing)

One thing to note about the istep numbers is that they can go
*backwards* if our firmware needs to do a reconfigure loop (e.g. we're
after a firmware update and needing to flash a seeprom inside the chip,
or we've discovered a problem with one of the cores and we're going to
disable it).

On the more enterprise-y POWER systems, there's SRC codes, which
are a set of incomprehensible hexadecimal numbers in a seemingly random
order designed to a) fit on a tiny LCD screen on the front of the
machine and b) not be strings that would have to be translated.
(I *always* have to google them, and even then, I don't think it helps)

If there's a problem during boot, we'd generally look at the console
output.... unless boot failure is *really* *REALLY* early, in which case
it's before we have any communications channel to the BMC open (and you
have to go and poke at the chip through one of the debug
interfaces... although we would like to improve this situation)

>> It just seems like the first thing anyone is going to do with these numb=
ers is
>> look them up and map them to something.  Wouldn=E2=80=99t it make sense =
to have
>> done that mapping already at the API level so that every user and piece =
of
>> code using this API doesn=E2=80=99t have to do it themselves?
> That seems like a reasonable assumption, but practically isn't always
> an option;  In general the POST code mappings are difficult to come
> by, especially in initial system bringup, and that is when they are
> most valuable.  If attempted, the ability to provide a mapping should
> be made optional, which means the proposed interface still needs to
> exist.

What if it was a "number and/or string" kind of interface? Would that work?=
 On
x86 if you only have the method of getting a number out, you could just
have the numbers (unless you have a mapping somewhere), but on POWER we
could hook this up to get a number and/or string from firmware.

>> I think what I=E2=80=99m hinting at here is that you could add a per-pla=
tform config file
>> to your app that maps the codes to some enumerations in the DBus
>> interface, and apply that mapping before you emit the signal. If you wan=
ted
>> to go back to numbers later you could just reverse the mapping using the
>> same config file.  Please poke holes.
>
> I would argue that this functionality is outside the scope of Patricks
> patch.  We could very clearly do as you're suggesting, but it would be
> error prone, and make per-platform configuration more difficult to
> port, and would likely take a number of months to get correct for all
> platforms.  As is, Patricks patch adds value outside of his direct
> platform, as other teams would have an immediate use of it, and is
> very clear and clean to implement.  Building the platform configurable
> API you suggest would take a lot more time and effort, for only a
> little incremental value.  This seems like a case of "Perfect is the
> enemy of good".  As is, both the API and the daemon are things that I
> would use today on my platforms.

Would a universal interface look something like this:

- enum ProgressStages
  (to support things like IPMI fw progress, i.e. generic and well
  accepted what these mean)
- int (descriptive integer, platform specific, 0=3Dunknown)
- string (descriptive, platform specific, can be null)

with each platform implementing whatever parts of that they can.

Looks like x86 post codes would go in the int, maybe a lookup table for
the string (if available).

For POWER, we'd poke the istep number into the int, and a description
into the string (from the host, some unknown mechanism to do that).

thoughts?
--=20
Stewart Smith
OPAL Architect, IBM.
