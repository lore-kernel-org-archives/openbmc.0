Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tHLwc6n4zzDvXK
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 17:59:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAE6wmgH094717
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 01:59:11 -0500
Received: from e28smtp03.in.ibm.com (e28smtp03.in.ibm.com [125.16.236.3])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26q05nsy1r-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 01:59:08 -0500
Received: from localhost
 by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 14 Nov 2016 12:29:01 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 14 Nov 2016 12:28:59 +0530
Received: from d28relay09.in.ibm.com (d28relay09.in.ibm.com [9.184.220.160])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id 742FCE0024
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 12:29:08 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay09.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAE6wxTC20316274
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 12:28:59 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uAE6wudc002306
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 12:28:58 +0530
Received: from Deepaks-MacBook-Pro.local ([9.109.127.83])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uAE6wtLd002284; Mon, 14 Nov 2016 12:28:55 +0530
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: D-Bus interfaces for FRU VPD inventory
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 14 Nov 2016 12:28:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------01FFA97CC766A3FED1C1D9A8"
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16111406-0008-0000-0000-000003892505
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16111406-0009-0000-0000-0000109136F3
Message-Id: <0ec0dd36-c0c4-ac1e-6e7b-8dbb73196a78@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611140138
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
X-List-Received-Date: Mon, 14 Nov 2016 06:59:13 -0000

This is a multi-part message in MIME format.
--------------01FFA97CC766A3FED1C1D9A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'd like to solicit feedback on the d-bus interfaces that we're defining to represent FRU information, also known as FRU VPD (Vital Product Data).

A little background :

- The d-bus interfaces are being written as Inventory interfaces, as YAML files, under the openbmc/phosphor-dbus-interfaces repo [1].
- As far as sources/formats of VPD are concerned, we've looked at the IPMI FRU information spec [2], and the open-power VPD format [3].
- The goal has been to define properties in the d-bus interfaces to describe various pieces of FRU VPD, and to describe them in such a way that they're agnostic to the VPD format. It would be up to VPD related applications to parse specific VPD formats and then to populate the Inventory via the new d-bus interfaces.
- There are in general two classes of interfaces : those describing physical items such as processors, DIMMs, etc.; and those describing virtual items such as a replaceable item, a repairable item, an item having voltage control enabled, etc.
- We've realized that each and every property from the IPMI or the open-power spec need not be mapped as-is. D-Bus objects could implement an aggregate of interfaces to represent a specific item or FRU, and to have all relevant properties contained. For instance, we have interfaces such as an Asset Item, a generic Item, that could apply to multiple types of FRUs.
- There are currently two commits up in Gerrit for review. One commit is specific to open-power interfaces [4] (since these could describe properties specific to IBM systems, and may eventually be moved to a new repo), and another commit for generic properties [5].


I'm looking for :

- Code review comments on [4] and [5].
- Any properties that you think should be added or left out.
- Any other comments on the interface design.

For details on specific properties that have been mapped, I have a section below that you may want to have a look at.

[1] https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory
[2] http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/platform-management-fru-document-rev-1-2-feb-2013.pdf
[3] https://github.com/open-power/vpdtools/tree/master/examples/p9/sysplanar32_ddr4
[4] https://gerrit.openbmc-project.xyz/#/c/1095/
[5] https://gerrit.openbmc-project.xyz/#/c/1094/




1) Properties mapped from the IPMI FRU information spec :
- The IPMI FRU information spec classifies FRU information into three broad areas : Chassis Info Area, Board Info Area and Product Info Area.

IPMI property

	

D-Bus property

Chassis Type

	

Item.interface : PrettyName

Chassis Part Number

	

Asset.interface : PartNumber

Chassis Serial Number

	

Asset.interface : SerialNumber

Board Manufacturing Date/Time

	

Asset.interface : BuildDate

Board Manufacturer

	

Asset.interface : Manufacturer

Board Product Name

	

Item.interface : PrettyName

Board Serial Number

	

Asset.interface : SerialNumber

Board Part Number

	

Asset.interface : PartNumber

Board FRU File ID

	

Asset.interface : FileId

Product Manufacturer

	

Asset.interface : Manufacturer

Product Name

	

Item.interface : PrettyName

Product Part Number

	

Asset.interface : PartNumber

Product Serial Number

	

Asset.interface : SerialNumber

Product Version

	

Revision.interface : Version

Product Asset Tag

	

Not mapped yet


2) The open-power VPD format uses a record/keyword mechanism to describe FRU VPD. A record is a group of related keywords. A keyword is a specific property. There are too many keywords to individually list here (please see [3]), hence I've shown how we've mapped records.

open-power property

	

D-Bus property

VINI record (applies to all FRUs, general FRU information such as serial number, part number)

	

See Asset.interface, Item.interface

OPFR record (applies to all FRUs, more general FRU information such as vendor name, build date)

	

See Asset.interface, Item.interface

MEMD record (direct-attached memory specific keywords)

	

See Dimm.DirectAttached.interface

Processor specific keywords coming from various records

	

See Cpu.interface

VNDR record (applies to multiple FRUs, custom information that can be added by the FRU vendor)

	

See VendorInformation.interface

MER0, VER0 records (applies to multiple FRUs, FRU repair information)

	

See RepairData.interface

VRTN record (applied to all FRUs, information to enable FRU replacement)

	

See Replaceable.interface

OSYS record (information specific to a system as a whole)

	

See Motherboard.interface


Thanks,
Deepak


--------------01FFA97CC766A3FED1C1D9A8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <pre wrap="">Hello,

I'd like to solicit feedback on the d-bus interfaces that we're defining to represent FRU information, also known as FRU VPD (Vital Product Data).

A little background :

- The d-bus interfaces are being written as Inventory interfaces, as YAML files, under the openbmc/phosphor-dbus-interfaces repo [1].
- As far as sources/formats of VPD are concerned, we've looked at the IPMI FRU information spec [2], and the open-power VPD format [3].
- The goal has been to define properties in the d-bus interfaces to describe various pieces of FRU VPD, and to describe them in such a way that they're agnostic to the VPD format. It would be up to VPD related applications to parse specific VPD formats and then to populate the Inventory via the new d-bus interfaces.
- There are in general two classes of interfaces : those describing physical items such as processors, DIMMs, etc.; and those describing virtual items such as a replaceable item, a repairable item, an item having voltage control enabled, etc.
- We've realized that each and every property from the IPMI or the open-power spec need not be mapped as-is. D-Bus objects could implement an aggregate of interfaces to represent a specific item or FRU, and to have all relevant properties contained. For instance, we have interfaces such as an Asset Item, a generic Item, that could apply to multiple types of FRUs.
- There are currently two commits up in Gerrit for review. One commit is specific to open-power interfaces [4] (since these could describe properties specific to IBM systems, and may eventually be moved to a new repo), and another commit for generic properties [5].


I'm looking for :

- Code review comments on [4] and [5].
- Any properties that you think should be added or left out.
- Any other comments on the interface design.

For details on specific properties that have been mapped, I have a section below that you may want to have a look at.

[1] <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory">https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory</a>
[2] <a class="moz-txt-link-freetext" href="http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/platform-management-fru-document-rev-1-2-feb-2013.pdf">http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/platform-management-fru-document-rev-1-2-feb-2013.pdf</a>
[3] <a class="moz-txt-link-freetext" href="https://github.com/open-power/vpdtools/tree/master/examples/p9/sysplanar32_ddr4">https://github.com/open-power/vpdtools/tree/master/examples/p9/sysplanar32_ddr4</a>
[4] <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/1095/">https://gerrit.openbmc-project.xyz/#/c/1095/</a>
[5] <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/1094/">https://gerrit.openbmc-project.xyz/#/c/1094/</a>




1) Properties mapped from the IPMI FRU information spec :
- The IPMI FRU information spec classifies FRU information into three broad areas : Chassis Info Area, Board Info Area and Product Info Area.

</pre>
    <table border="1" cellpadding="2" cellspacing="2" width="100%">
      <tbody>
        <tr>
          <td align="center" valign="top">
            <pre wrap="">IPMI property
</pre>
          </td>
          <td align="center" valign="top">
            <pre wrap="">D-Bus property
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Chassis Type</pre>
          </td>
          <td align="center" valign="top">
            <pre>Item.interface : PrettyName</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Chassis Part Number</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : PartNumber</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Chassis Serial Number</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : SerialNumber</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Board Manufacturing Date/Time</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : BuildDate</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Board Manufacturer</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : Manufacturer</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Board Product Name</pre>
          </td>
          <td align="center" valign="top">
            <pre>Item.interface : PrettyName</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Board Serial Number</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : SerialNumber</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Board Part Number</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : PartNumber</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Board FRU File ID</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : FileId</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Product Manufacturer</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : Manufacturer</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Product Name</pre>
          </td>
          <td align="center" valign="top">
            <pre>Item.interface : PrettyName</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Product Part Number</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : PartNumber</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Product Serial Number</pre>
          </td>
          <td align="center" valign="top">
            <pre>Asset.interface : SerialNumber</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Product Version</pre>
          </td>
          <td align="center" valign="top">
            <pre>Revision.interface : Version</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Product Asset Tag</pre>
          </td>
          <td align="center" valign="top">
            <pre>Not mapped yet</pre>
          </td>
        </tr>
      </tbody>
    </table>
    <pre wrap="">

2) The open-power VPD format uses a record/keyword mechanism to describe FRU VPD. A record is a group of related keywords. A keyword is a specific property. There are too many keywords to individually list here (please see [3]), hence I've shown how we've mapped records.

</pre>
    <table border="1" cellpadding="2" cellspacing="2" width="100%">
      <tbody>
        <tr>
          <td align="center" valign="top">
            <pre>open-power property
</pre>
          </td>
          <td align="center" valign="top">
            <pre>D-Bus property
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>VINI record (applies to all FRUs, general FRU information such as serial number, part number)
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See Asset.interface, Item.interface
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>OPFR record (applies to all FRUs, more general FRU information such as vendor name, build date)
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See Asset.interface, Item.interface
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>MEMD record (direct-attached memory specific keywords)
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See Dimm.DirectAttached.interface
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>Processor specific keywords coming from various records
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See Cpu.interface
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>VNDR record (applies to multiple FRUs, custom information that can be added by the FRU vendor)
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See VendorInformation.interface
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>MER0, VER0 records (applies to multiple FRUs, FRU repair information)
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See RepairData.interface
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>VRTN record (applied to all FRUs, information to enable FRU replacement)
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See Replaceable.interface
</pre>
          </td>
        </tr>
        <tr>
          <td align="center" valign="top">
            <pre>OSYS record (information specific to a system as a whole)
</pre>
          </td>
          <td align="center" valign="top">
            <pre>See Motherboard.interface
</pre>
          </td>
        </tr>
      </tbody>
    </table>
    <pre wrap="">

Thanks,
Deepak
</pre>
  </body>
</html>

--------------01FFA97CC766A3FED1C1D9A8--
