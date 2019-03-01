Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44B2V73RzDzDqTf
 for <openbmc@lists.ozlabs.org>; Sat,  2 Mar 2019 08:23:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x21LNtMU062537
 for <openbmc@lists.ozlabs.org>; Fri, 1 Mar 2019 16:23:56 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qybqtt56j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 16:23:56 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Fri, 1 Mar 2019 21:23:48 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 1 Mar 2019 21:23:45 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x21LNicn24510614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 1 Mar 2019 21:23:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FC59AC067
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 21:23:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68BA4AC064
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 21:23:44 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 21:23:44 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Mar 2019 15:31:12 -0600
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: [Design] Kernel-based BMC firewall
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030121-0060-0000-0000-00000314775E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010688; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01168227; UDB=6.00610370; IPR=6.00948842; 
 MB=3.00025799; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-01 21:23:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030121-0061-0000-0000-00004877E892
Message-Id: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-01_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903010145
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
X-List-Received-Date: Fri, 01 Mar 2019 21:24:00 -0000

Here is my BMC firewall design.  I'll post it as a gerrit docs review in 
a few days if nobody steers this in a different direction.

Highlights:
  - firewall established by default when networking starts
  - BMC-specific firewall rules to be documented
  - firewall logging not started by default

Enjoy,

- Joseph Reynolds


# Firewall

Author:
   Joseph Reynolds <josephreynolds1>
Primary assignee:
   < Name and/or IRC nic or None >
Other contributors:
   < Name and/or IRC nic or None >
Created:
   2019-03-01

## Problem Description

OpenBMC needs an integral firewall to monitor and control its IP 
traffic.

## Background and References

The Yocto/OpenEmbedded projects offer ready-made Linux kernel-based
firewall recipes.  These are based on:
  - the Linux `netfilter` kernel modules which provide the basic 
capability
    to work with IP packets.
  - the `iptables` Linux command (and similar commands like ip6tables) 
work
    with netfilter tables
  - the `arno-iptables-firewall` package which provides shell scripts 
that
    uses iptables to establish a firewall.
  - the `ulogd` firewall logger package

References:
- The Linux firewall documentation:
   http://linuxdocs.org/HOWTOs/Firewall-HOWTO-2.html
- Basic concepts from Wikipedia:
   - https://en.wikipedia.org/wiki/Netfilter
   - https://en.wikipedia.org/wiki/Iptables
- The OpenEmbedded recipes for firewalls:
   
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=iptables
- Log connections via ulogd.

## Requirements

The BMC must automatically establish a firewall when the network
service is started, and remove it when networking stops.  The firewall
rules must have reasonable defaults for a BMC.

The firewall must have these capabilities:
  1. Block unauthorized IP traffic to and from the BMC.
  2. Block malicious packets.
  3. Log network traffic.
  4. Rate-limiting to thwart denial of service attacks.

The firewall must not:
- Consume excessive CPU cycles.
- Consume excessive space in memory or on disk.

The system integrator must be able to:
- Establish firewall rules to implement security policy.
- Set default IP logging behavior.
- Configure the firewall for IPv4, IPv6, or both.
- Remove firewall capabilty from the BMC if desired.

The admin user must be able to:
- Temporarily modify, disable, or re-enable the firewall.
- Enable or disable IP logging.
- Retrieve the firewall logs, if enabled.

## Proposed Design

This adds a set of BitBake recipes to set up an IP firewall based on
Linux kernel netfilter modules, the iptables commands, and the
arno-iptables-firewall package.

The firewall gets put up when systemd starts the networking service, and
gets taken down when networking stops.
The firewall logging service is also made available, but it is not 
started

The firewall rules will default to disallow all IP traffic, then be
permissive in allowing all legitimate BMC traffic.  We'll have
customized firewall rules specific to a generic BMC environment and
document these rules in the docs repository.

These rules are intended to be "secure by design" and documented well
enough for a system integrator to change them as needed.

## Alternatives Considered

A user interface to indicate the firewall's status was considered.
This would invoke iptables and return success only if it showed
firewall rules, something like `iptables -L -n -v`.  This is not
needed for basic function.

The `ufw` firewall was considered.  It is implemented in Python which
is being removed from the OpenBMC image.

## Impacts

There are three levels of impact:
1. If the firewall recipes are present:
  - Uses more flash space for kernel modules and iptables commands.
2. When the firewall is enabled:
  - Uses more memory for kernel modules and related tables.
  - Uses more CPU cycles for network service.
3. When the firewall IP logging service is enabled:
  - Uses more resources for CPU and log file storage.

If the firewall rules are overly restrictive, functions which require
IP may not work correctly.  The documentation must show how to
identify and fix this problem, specifically:
  - How to enable IP logging.
  - How to find, read, and interpret the log.
  - How to change firewall rules to allow your traffic.

## Testing

Ensure all functions which use IP continue to work.  Enable firewall
IP logging during these tests, and check it for errors.

 From the requirement section:
  - Test the firewall's capabilities.  For example:
     - Send badly formed packets.
     - Send traffic to closed ports.
  - Test each of the admin user's functions.

Test the procedure to enable logging and detect blocked IP traffic.

Note the recommended dev-environment [1] maps TCP ports 22 and 443 (to
ports 2222 and 2443).  This is not an issue for the BMC's firewall
because this mapping is done by the simulator, so the BMC sees the
original port numbers: 22 and 443.

[1]: 
https://github.com/openbmc/docs/blob/master/development/dev-environment.md
