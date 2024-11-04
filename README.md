# Global Name and Unified Namespace Database 
## Summary
The purpose of the database is to manage common names for metric names. 
The metric is an engineering scaled value 
and its name should be the same between different systems. 
The database is also the main source for units and 
physical dimensions.

The database is also useful for Unified Namespace (UNS) and Sparkplug B applications.

### Global Names
Parameters and metrics are engineering values i.e. scaled values while signals and channels are non-scaled
values.
The name 

### Database
The database is based upon an ASAM ODS database model. 
An ODS database is different from a normal database as it includes the database, application and base models. 
This simplifies the upgrade, import and export functions as they can be database independent. 
Also some GUI applications can be generalized as they also can be done database independent.

The database is divided into three or more independent functional blocks.
- **Global Names**. These tables holds the global names, units, physical units and quantities. 
- **Unified Namespace**. These tables divide the organization into location cells.
- **Sparkplug B Configuration**. Defines one or more Sparkplug B node, device and metrics configuration.

Note that the last Sparkplug B configuration is optional and could be replaced with another type of
configuration.

### Use Case for Global Names
A user imports all signals and parameters from a CAN DBC into some logger. 
The logger file now consists of byte arrays i.e., CAN messages.
The log file shall now be converted from byte arrays to parameter values by using the DBC file.
The measurement values shall typically be converted to some column-based file as Parquet.
The conversion task will no also rename the DBC local name to a global name.

### Unified Namespace
The goal is to divide the organization into smaller location cells. 
The model support 4 location levels.
- **Plant**. Plant or division name.
- **Area**. Area or subdivision.
- **Line**. Main line type.
- **Cell**. Production or test cell.

### Sparkplug B Configuration
The Sparkplug B configuration defines all nodes and hosts in a Sparkplug B system. 
It is questionable if this should be in another database but for the time being this is within 
this database.

### GUI
There is one GUI for the Global Names and one for the Sparkplug B Configuration.
