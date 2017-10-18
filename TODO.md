# TODO

## Schema

### Architecture Schema

- Application
  - Services
- Middleware
  - Effect
  - Configuration
- Service
  - Works
- Work
  - Effect
  - ResourceConsumption
  - ClientCall
- ClientCall
  - Application
  - Service
  - Middleware
  - Payload
- DurableStorage
  - Size
  - Speeds
  - State
- SharedStorage
  - Size
  - Speeds
  - State
- InstanceGroups
  - Application
  - Instances
- Tiers
  - InstanceGroups

### Events Schema

- RequestSource
  - Generator
  - PayloadDistribution
- Snapshots

### User Actions

- CRUD for all architecture elements

### Scenario Schema

- Architecture
- Actions Allowed
- Architecture Locked
